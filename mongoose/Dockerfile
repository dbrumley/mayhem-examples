FROM debian:stable-slim
RUN apt-get update && apt-get -y install build-essential clang git libssl-dev
WORKDIR /build
COPY src src
RUN git clone https://github.com/cesanta/mongoose.git && \ 
    cd src && \
    CC=clang make
