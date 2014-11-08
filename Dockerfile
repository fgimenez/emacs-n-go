FROM ubuntu:14.04

MAINTAINER Federico Gimenez Nieto <federico.gimenez@coit.es>

# Install packages: wget, git, mercurial and emacs
RUN apt-get update && \
    apt-get install -y wget git mercurial emacs && \
    apt-get clean

# Download and install the Go
RUN wget http://golang.org/dl/go1.3.3.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.3.3.linux-amd64.tar.gz && \
    rm go1.3.3.linux-amd64.tar.gz

# Add the Go executables to our path
ENV PATH $PATH:/usr/local/go/bin:/workspace/bin

# Create a Go workspace directory
RUN mkdir -p /workspace/bin /workspace/pkg /workspace/src

WORKDIR /workspace
ENV GOPATH /workspace
ENV GOROOT /usr/local/go