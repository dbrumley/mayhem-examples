FROM ocaml/opam:debian as builder
RUN opam init --auto-setup --comp=4.07.1 --yes
COPY readline.ml .
COPY good-input.txt .
COPY bad-input.txt .
RUN eval `opam config env` && ocamlopt  readline.ml -o readline
CMD ["/home/opam/readline", "bad-input.txt"]

FROM debian:stable-slim
WORKDIR /mayhem
COPY --from=builder /home/opam/readline .
COPY bad-input.txt .
COPY good-input.txt .
CMD ["/mayhem/readline", "bad-input.txt"]
