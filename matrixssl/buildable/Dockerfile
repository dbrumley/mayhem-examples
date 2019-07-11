FROM debian:buster-slim

RUN apt-get update && apt-get install -y git clang build-essential make

WORKDIR /workdir
RUN git clone https://github.com/matrixssl/matrixssl.git && cd matrixssl && git checkout dbc2786c73d32f98c6496176c356778b6dac7de6

RUN cd matrixssl && make

COPY fuzz_x509.c /workdir/matrixssl/crypto/keyformat/fuzz_x509.c

RUN cd matrixssl/crypto/keyformat && clang fuzz_x509.c ../libcrypt_s.a ../../matrixssl/libssl_s.a ../../core/*.a -lpthread -o /test_standalone


RUN cd matrixssl && make clean && CC=clang CFLAGS="-fsanitize=address -Wl,address" make || true
RUN cd matrixssl/crypto/keyformat && clang -DLIBFUZZER -fsanitize=address,fuzzer fuzz_x509.c ../libcrypt_s.a ../../matrixssl/libssl_s.a ../../core/*.a -lpthread -o /test_asan
