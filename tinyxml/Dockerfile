FROM debian:stable-slim as builder
RUN apt-get update && apt-get install -y build-essential wget 
WORKDIR /build
COPY harness .
COPY corpus .
RUN wget https://github.com/leethomason/tinyxml2/archive/7.0.1.tar.gz && \
   tar zxf 7.0.1.tar.gz  && \
   cd tinyxml2-7.0.1 && \
   make &&  \
   cd .. &&  \
   make

FROM debian:stable-slim
WORKDIR /mayhem
COPY --from=builder /build/gcr-harness2 .
COPY --from=builder /build/gcr-harness .
COPY --from=builder /build/harness .
COPY --from=builder /build/harness-collapse .
COPY corpus corpus
CMD ["/mayhem/gcr-harness2", "corpus/utf8test.xml"]
