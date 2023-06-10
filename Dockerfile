FROM ubuntu:22.04

WORKDIR /osmium-tool
RUN apt-get update && \
    apt-get install -y libosmium2-dev libprotozero-dev rapidjson-dev libboost-program-options-dev libbz2-dev zlib1g-dev liblz4-dev libexpat1-dev build-essential cmake
COPY . /osmium-tool
WORKDIR /osmium-tool/build
RUN cmake .. && \
    make

ENTRYPOINT [ "/osmium-tool/build/osmium" ]
