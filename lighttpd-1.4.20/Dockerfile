FROM debian:stable-slim as builder
RUN apt-get update && apt-get install -y build-essential wget
WORKDIR /build
RUN wget https://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.20.tar.gz \
   && tar xf lighttpd-1.4.20.tar.gz \
   && cd /build/lighttpd-1.4.20 \
   && ./configure --without-bzip2 --without-pcre --without-zlib && make && make install \
   && mkdir /www && echo "lighttpd 1.4.20 running!" > /www/index.html
COPY lighttpd.conf /usr/local/etc
CMD ["/usr/local/sbin/lighttpd","-D", "-f","/usr/local/etc/lighttpd.conf"]
EXPOSE 80

FROM debian:stable-slim
WORKDIR /root
COPY --from=builder /usr/local /usr/local
RUN mkdir /www && echo "lighttpd 1.4.20 running!" > /www/index.html
CMD ["/usr/local/sbin/lighttpd","-D", "-f","/usr/local/etc/lighttpd.conf"]
EXPOSE 80
