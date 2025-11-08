import com.sun.net.httpserver.{HttpServer, HttpExchange, HttpHandler}
import java.net.InetSocketAddress
import java.io.{InputStream, OutputStream}
import scala.util.{Try, Using}
import scala.io.Source

case class PrimeRequest(number: Int)
case class PrimeResponse(is_prime: Boolean)

object Main {
  def main(args: Array[String]): Unit = {
    val port = sys.env.get("PORT").map(_.toInt).getOrElse(3000)
    val server = HttpServer.create(new InetSocketAddress("0.0.0.0", port), 0)
    
    server.createContext("/", new PrimeHandler)
    server.setExecutor(java.util.concurrent.Executors.newCachedThreadPool())
    server.start()
    
    println(s"Server started on port $port")
    
    val lock = new Object
    lock.synchronized {
      lock.wait()
    }
  }
  
  class PrimeHandler extends HttpHandler {
    def handle(exchange: HttpExchange): Unit = {
      var os: OutputStream = null
      try {
        val method = exchange.getRequestMethod
        
        if (method == "POST") {
          val inputStream = exchange.getRequestBody
          val requestBody = scala.io.Source.fromInputStream(inputStream, "UTF-8").mkString
          inputStream.close()
          
          val number = parseNumberFromJson(requestBody)
          
          val isPrime = isPrimeNumber(number)
          
          val response = s"""{"is_prime":$isPrime}"""
          val responseBytes = response.getBytes("UTF-8")
          
          exchange.getResponseHeaders().set("Content-Type", "application/json")
          exchange.sendResponseHeaders(200, responseBytes.length.toLong)
          os = exchange.getResponseBody
          os.write(responseBytes)
          os.flush()
        } else {
          val response = """{"error":"Method not allowed"}"""
          val responseBytes = response.getBytes("UTF-8")
          exchange.getResponseHeaders().set("Content-Type", "application/json")
          exchange.sendResponseHeaders(405, responseBytes.length.toLong)
          os = exchange.getResponseBody
          os.write(responseBytes)
          os.flush()
        }
      } catch {
        case e: Exception =>
          try {
            val response = s"""{"error":"${e.getMessage}"}"""
            val responseBytes = response.getBytes("UTF-8")
            exchange.getResponseHeaders().set("Content-Type", "application/json")
            exchange.sendResponseHeaders(500, responseBytes.length.toLong)
            os = exchange.getResponseBody
            os.write(responseBytes)
            os.flush()
          } catch {
            case _: Exception => 
          }
      } finally {
        if (os != null) {
          os.flush()
          os.close()
        }
      }
    }
    
    def parseNumberFromJson(json: String): Int = {
      val trimmed = json.trim
      val numberStart = trimmed.indexOf("\"number\"")
      if (numberStart == -1) {
        throw new IllegalArgumentException("Invalid JSON: number field not found")
      }
      val colonPos = trimmed.indexOf(':', numberStart)
      if (colonPos == -1) {
        throw new IllegalArgumentException("Invalid JSON: malformed number field")
      }
      val valueStart = colonPos + 1
      val valueEnd = trimmed.indexWhere(c => c == ',' || c == '}', valueStart)
      val valueStr = if (valueEnd == -1) trimmed.substring(valueStart).trim else trimmed.substring(valueStart, valueEnd).trim
      valueStr.toInt
    }
    
    def isPrimeNumber(number: Int): Boolean = {
      if (number < 2) {
        return false
      }
      val sqrt = math.sqrt(number).toInt
      var i = 2
      while (i <= sqrt) {
        if (number % i == 0) {
          return false
        }
        i += 1
      }
      true
    }
  }
}

