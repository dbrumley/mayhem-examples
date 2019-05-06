FROM rust:1.34.1-stretch
WORKDIR /usr/src/badrs
COPY . .
RUN cargo install --path .
CMD ["badrs", "bad-input.txt"]

