FROM debian:stable-slim
WORKDIR /mayhem
COPY src/ .
COPY good.txt .
COPY bad.txt .
CMD ["/mayhem/example.sh", "bad.txt"]
