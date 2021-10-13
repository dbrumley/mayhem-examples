FROM ubuntu:latest
RUN apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get install -y build-essential cmake ninja-build libboost-dev git libc6-dbg
WORKDIR /libbw64
RUN git clone https://github.com/ebu/libbw64.git && \
   cd libbw64 && \
   mkdir build && \
   cd build && \
   cmake .. -G Ninja -DCMAKE_BUILD_TYPE=Debug -DBUILD_SHARED_LIBS=True -DBUILD_SHARED_LIBS=False && \
   cmake --build . 
CMD ["/libbw64/libbw64/build/examples @@ /dev/null"]
