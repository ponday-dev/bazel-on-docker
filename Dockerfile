FROM ubuntu:18.10

RUN mkdir /work
WORKDIR /work

SHELL ["bash", "-lc"]
ARG version="0.16.0"

RUN apt-get update && \
    apt-get install -y \
    curl \
    pkg-config \
    zip \
    unzip \
    g++ \
    zlib1g-dev \
    python
RUN apt-get clean

RUN curl -LO https://github.com/bazelbuild/bazel/releases/download/${version}/bazel-${version}-installer-linux-x86_64.sh && \
    chmod +x bazel-${version}-installer-linux-x86_64.sh && \
    ./bazel-${version}-installer-linux-x86_64.sh --user && \
    rm  -f ./bazel-${version}-installer-linux-x86_64.sh
ENV PATH $PATH:$HOME/bin

