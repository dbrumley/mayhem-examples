FROM rustlang/rust:nightly
WORKDIR /usr/src/badrs
COPY . .
RUN cargo install --path .
CMD ["badrs", "bad-input.txt"]

