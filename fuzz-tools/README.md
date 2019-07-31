# Batteries Included Fuzzing Base Build Image

This `Dockerfile` builds an image with:
  - Clang, Clang++, and the [libfuzzer](https://llvm.org/docs/LibFuzzer.html) tools installed.
  - [AFL](http://lcamtuf.coredump.cx/afl/) installed.
  - [HonggFuzz](https://github.com/google/honggfuzz) installed.

## To run

You can run an already built version from dockerhub.com:

```bash
docker run -ti forallsecure/fuzz-tools bash
```


## To Build

You can use your normal `docker build` process to build.

We've included a `Makefile` which will build and automatically push to
dockerhub.com using your DOCKER ID.

This image is *big* (about 950MB) because it installs all tools.

```bash
make DOCKER ID=<your Docker ID>
```

For example:
```bash
make DOCKERID=forallsecure
```

You can then run the image as normal, e.g.:

```bash
docker run -ti bash <your Docker ID>/fuzz-tools bash
```


## Notes

We use a multi-stage docker build, which installs honggfuzz in
`/usr/local` and removes the original honggfuzz source code to save a
tiny bit on size.
