FROM debian:stable-slim as builder
RUN apt-get update && \
    apt-get install -y build-essential wget vim emacs afl libfuzzer-4.0-dev libfuzzer-3.9-dev git autoconf
WORKDIR /mayhem
