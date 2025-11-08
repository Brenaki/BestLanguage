FROM sbtscala/scala-sbt:eclipse-temurin-24.0.1_9_1.11.7_3.7.3 AS builder

WORKDIR /app

COPY build.sbt ./
COPY project ./project
COPY src ./src

RUN sbt clean compile && \
    mkdir -p /tmp/scala-libs && \
    find ~/.ivy2/cache/org.scala-lang -name "*.jar" -type f -exec cp {} /tmp/scala-libs/ \; 2>/dev/null || true && \
    find ~/.cache/coursier -name "scala3-library*.jar" -type f -exec cp {} /tmp/scala-libs/ \; 2>/dev/null || true && \
    find ~/.cache/coursier -name "scala-library*.jar" -type f -exec cp {} /tmp/scala-libs/ \; 2>/dev/null || true

FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

COPY --from=builder /app/target ./target

COPY --from=builder /tmp/scala-libs ./scala-libs

EXPOSE 3000

RUN echo '#!/bin/sh' > /app/run.sh && \
    echo 'CLASSES_DIR=$(find target -type d -name "classes" | head -1)' >> /app/run.sh && \
    echo 'SCALA_LIBS=$(find scala-libs -name "*.jar" | tr "\\n" ":")' >> /app/run.sh && \
    echo 'java -Xmx128m -Xms64m -XX:MaxMetaspaceSize=64m -XX:+UseSerialGC -cp "$CLASSES_DIR:$SCALA_LIBS" Main' >> /app/run.sh && \
    chmod +x /app/run.sh

CMD ["/app/run.sh"]

