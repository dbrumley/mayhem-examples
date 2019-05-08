FROM debian:stable-slim as builder
RUN apt-get update && apt-get install -y build-essential wget git libreadline-dev libpcre3-dev 
WORKDIR /build
COPY corpus corpus
RUN git clone https://github.com/nginx/njs.git && \
    cd njs && \
    ./configure && \
    make
CMD ["/build/njs/build/njs","/build/corpus/segfault.txt"]

FROM debian:stable-slim
RUN apt-get update && apt-get install -y libreadline-dev libpcre3-dev
WORKDIR /mayhem
COPY corpus corpus
COPY --from=builder /build/njs/build/njs /mayhem/njs
CMD ["/mayhem/njs","/mayhem/corpus/segfault.txt"]
