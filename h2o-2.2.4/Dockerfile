FROM dbrumley/debian-developer-tools  as builder
WORKDIR /mayhem
RUN apt-get update && apt-get install -y cmake  openssl zlib1g-dev libipc-signal-perl liblist-moreutils-perl libwww-perl libio-socket-ssl-perl && \
   wget https://github.com/h2o/h2o/archive/v2.2.4.tar.gz \
   && tar xf v2.2.4.tar.gz \
   && cd /mayhem/h2o-2.2.4 \
   && cmake . \
   && make \
   && make install \
   && mkdir /www && echo "h2o 2.2.4 running!" > /www/index.html
COPY h2o.conf .
CMD ["/usr/local/bin/h2o","-c", "/mayhem/h2o.conf"]
EXPOSE 80

FROM debian:stable-slim
RUN apt-get update && apt-get install -y openssl zlib1g-dev libipc-signal-perl liblist-moreutils-perl libwww-perl libio-socket-ssl-perl
WORKDIR /mayhem
COPY h2o.conf .
COPY --from=builder /usr/local /usr/local
RUN mkdir /www && echo "h2o 2.2.4 running!" > /www/index.html
CMD ["/usr/local/bin/h2o","-c", "/mayhem/h2o.conf"]
EXPOSE 80
