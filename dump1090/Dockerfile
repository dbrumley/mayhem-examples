FROM debian:stable-slim as builder
RUN apt-get update && apt-get install -y build-essential wget git libncurses5-dev
WORKDIR /build
RUN git clone https://github.com/flightaware/dump1090.git && \
    cd dump1090 && \
    make BLADERF=no RTLSDR=no
CMD ["/build/dump1090/dump1090","--ifile", "/build/dump1090/testfiles/modes1.bin", "--stats"]

FROM debian:stable-slim
RUN apt-get update && apt-get install -y libncurses5-dev
WORKDIR /mayhem
COPY --from=builder /build/dump1090/dump1090 /mayhem/dump1090
COPY --from=builder /build/dump1090/testfiles /mayhem/testfiles
CMD ["/mayhem/dump1090","--ifile", "/mayhem/testfiles/modes1.bin", "--stats"]
