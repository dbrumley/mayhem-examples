FROM ubuntu:20.04
RUN apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get install -y build-essential cmake ninja-build libboost-dev git libc6-dbg
WORKDIR /build
COPY testsuite /testsuite
RUN git clone https://github.com/ebu/libbw64.git && \
   cd libbw64 && \
   git checkout 64b513b && \
   mkdir build && \
   cd build && \
   cmake .. -G Ninja -DCMAKE_BUILD_TYPE=Debug -DBUILD_SHARED_LIBS=True -DBUILD_SHARED_LIBS=False && \
   cmake --build . 
CMD ["/build/libbw64/build/examples @@ /dev/null"]
