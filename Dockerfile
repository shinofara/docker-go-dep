FROM golang:1.8
MAINTAINER shinofara+docker@gmail.com

ENV GODEP_VERSION=a6fea7614da818a5f3c6cf7fe40645a1d4f3104c \
    GOPATH=/go

# Compile golang/dep
RUN mkdir -p /go
RUN go get -u github.com/golang/dep/... \
    && cd /go/src/github.com/golang/dep \
    && git checkout ${GODEP_VERSION} \
    && go install github.com/golang/dep/... \
    && mv /go/bin/dep /usr/bin

RUN echo "Host github.com\nStrictHostKeyChecking no\n" > /etc/ssh/ssh_config

ENTRYPOINT ["dep"]
