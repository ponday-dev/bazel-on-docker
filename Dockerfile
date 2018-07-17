FROM ubuntu:18.10

RUN mkdir /work
WORKDIR /work

RUN apt-get update && \
    apt-get install -y \
    curl \
    gnupg2

COPY bazel.list /etc/apt/sources.list.d
RUN curl https://storage.googleapis.com/bazel-apt/doc/apt-key.pub.gpg | apt-key add -
RUN apt-get update && \
    apt-get install -y bazel

