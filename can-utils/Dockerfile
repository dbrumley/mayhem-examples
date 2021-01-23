FROM debian:10-slim as builder
RUN apt-get update && apt-get install -y build-essential wget \
  clang \
  libfuzzer-7-dev \
  git
WORKDIR /build
COPY fuzz.c .
RUN git clone https://github.com/linux-can/can-utils.git  && \
  cd can-utils && \
  cp ../fuzz.c . && \
  clang -g -fsanitize=fuzzer,address -Wall -Wno-parentheses -Iinclude -DAF_CAN=PF_CAN -DPF_CAN=29 -DSO_RXQ_OVFL=40 -DSCM_TIMESTAMPING_OPT_STATS=54 -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE fuzz.c lib.c -o fuzz

FROM debian:stable-slim
WORKDIR /build/can-utils
COPY --from=builder /build/can-utils/fuzz .

