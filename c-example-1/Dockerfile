FROM debian:stable-slim as builder
RUN apt-get update && apt-get install -y build-essential wget
WORKDIR /build
COPY . .
RUN gcc -o app -O2 app.c


FROM debian:stable-slim
WORKDIR /mayhem
COPY --from=builder /build/ .
