FROM debian:buster-slim as builder
RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential \
    afl \
    autoconf \
    automake \
    binutils-dev \
    ca-certificates \
    clang-7.0-dev \
    clang++-7.0-dev \
    cmake \
    git \
    less \
    libboost-dev \
    libfuzzer-7-dev \
    libtool \
    libunwind-dev \
    libxml2-dev \
    python-dev \
    pkg-config \
    subversion \
    unzip && \
    update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-7 100 && \
    update-alternatives --install /usr/bin/clang clang /usr/bin/clang-7 100 && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /build
RUN git clone --depth=1 https://github.com/google/honggfuzz.git && \
    cd /build/honggfuzz && \
    make && make install && cd .. && rm -Rf honggfuzz
WORKDIR /mayhem
