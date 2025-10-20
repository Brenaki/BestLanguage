use actix_web::{web, App, HttpServer, Result};
use serde::{Deserialize, Serialize};

#[derive(Deserialize)]
struct PrimeRequest {
    number: i32,
}

#[derive(Serialize)]
struct PrimeResponse {
    is_prime: bool,
}

fn is_prime(number: i32) -> bool {
    if number < 2 {
        return false;
    }
    for i in 2..=((number as f64).sqrt() as i32) {
        if number % i == 0 {
            return false;
        }
    }
    true
}

async fn check_prime(req: web::Json<PrimeRequest>) -> Result<web::Json<PrimeResponse>> {
    let is_prime_result = is_prime(req.number);
    Ok(web::Json(PrimeResponse {
        is_prime: is_prime_result,
    }))
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new()
            .route("/", web::post().to(check_prime))
    })
    .bind("0.0.0.0:3000")?
    .run()
    .await
}