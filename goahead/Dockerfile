FROM debian:stable-slim as builder
RUN apt-get update && apt-get install -y build-essential wget git
WORKDIR /build
RUN git clone https://github.com/embedthis/goahead.git && \
    cd goahead && \
    ./configure  && \
     make && make install && \
    cp src/self.* /etc/goahead
CMD ["/usr/local/bin/goahead","--home","/etc/goahead/", "127.0.0.1"]
EXPOSE 80

FROM debian:stable-slim
RUN apt-get update && apt-get install -y make
WORKDIR /mayhem
COPY --from=builder /build /build
#RUN  cd /build/goahead && make install && cp src/self.* /etc/goahead
CMD ["/usr/local/bin/goahead","--home","/etc/goahead/", "127.0.0.1"]
EXPOSE 80

