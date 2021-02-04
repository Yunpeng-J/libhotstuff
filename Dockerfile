FROM ubuntu:18.04
# FROM openjdk:11
COPY . /home/libhotstuff
WORKDIR /home/libhotstuff

#install and source ansible
RUN apt-get update && apt-get install -y \
    libssl-dev libuv1-dev 
    #  autoconf libtool \
    # git cmake make vim build-essential

# RUN git submodule update --init --recursive \
#     && cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED=ON -DHOTSTUFF_PROTO_LOG=ON \
#     && make -j

