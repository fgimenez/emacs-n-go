FROM ubuntu:14.04

MAINTAINER Federico Gimenez Nieto <fgimenez@coit.es>

# Install packages: wget, git, mercurial and emacs
RUN apt-get update && \
    apt-get install -y wget git mercurial emacs24-nox && \
    apt-get clean

# Download and install the Go
RUN wget http://golang.org/dl/go1.4.2.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.4.2.linux-amd64.tar.gz && \
    rm go1.4.2.linux-amd64.tar.gz

# Set the path
ENV PATH $PATH:/usr/local/go/bin:/workspace/bin

# Create a Go workspace directory
RUN mkdir -p /workspace/bin /workspace/pkg /workspace/src

ENV GOPATH /workspace
ENV GOROOT /usr/local/go

# temporary fix for 9fans
RUN mkdir -p /tmp/9fans.net && \
    git clone https://github.com/9fans/go /tmp/9fans.net/go && \
    mv /tmp/9fans.net $GOPATH/src

# install go packages
RUN go get -u -v github.com/tools/godep && \
    go get -u -v github.com/nsf/gocode && \
    go get -u -v code.google.com/p/go.tools/cmd/goimports && \
    go get -u -v github.com/golang/lint/golint && \
    go get -u -v github.com/rogpeppe/godef

# clone emacs conf
RUN git clone https://github.com/fgimenez/.emacs.d.git /root/.emacs.d && \
    cd /root/.emacs.d && \
    git checkout origin/go

ENTRYPOINT /usr/bin/emacs /workspace/src
