FROM debian:stable-slim as builder
RUN apt-get update && apt-get install -y build-essential wget
WORKDIR /build
COPY testme .
COPY corpus/good.txt .
COPY bad.txt .
RUN make
CMD ["/build/testme-v1 good.txt"]

FROM debian:stable-slim
WORKDIR /mayhem
COPY --from=builder /build/testme-v1 .
COPY --from=builder /build/testme-v2 .
COPY corpus/good.txt .
COPY bad.txt .
CMD ["/mayhem/testme-v1 good.txt"]
