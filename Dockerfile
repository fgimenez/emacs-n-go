FROM ubuntu:14.04

MAINTAINER Federico Gimenez Nieto <fgimenez@coit.es>

# Install packages: wget, git, mercurial and emacs
RUN apt-get update && \
    apt-get install -y wget git mercurial emacs && \
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

# install go packages
RUN go get -u github.com/tools/godep && \
    go get -u github.com/nsf/gocode && \
    go get -u code.google.com/p/go.tools/cmd/goimports && \
    go get -u github.com/golang/lint/golint && \
    go get -u code.google.com/p/rog-go/exp/cmd/godef

# clone emacs conf
RUN git clone https://github.com/fgimenez/.emacs.d.git /root/.emacs.d && \
    cd /root/.emacs.d && \
    git checkout origin/go

ENTRYPOINT /usr/bin/emacs /workspace/src
