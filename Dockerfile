FROM alpine:latest

MAINTAINER Peter Mikus <pmikus@gmail.com>

# Install pre-requisities
RUN apk add --update alpine-sdk openssl-dev ca-certificates build-base perl cmake \
    && apk add --no-cache git

# Install wrk
RUN git clone https://github.com/ayourtch/wrk \
    && cd wrk \
    && make \
    && mv wrk /bin/

# Define default command
ENTRYPOINT ["/bin/wrk"]
