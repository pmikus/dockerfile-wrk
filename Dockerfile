FROM alpine:latest

MAINTAINER Peter Mikus <pmikus@gmail.com>

# Install pre-requisities
RUN apk add --no-cache git make perl \
    libgcc openssl build-base linux-headers

# Install wrk
RUN git clone https://github.com/ayourtch/wrk \
    && cd wrk \
    && sed -i 's/no-idea/no-idea no-async/' Makefile\
    && make -C  all\
    && mv wrk /bin/

# Cleanup
RUN apk del git make perl \
    openssl build-base linux-headers

# Define default command
ENTRYPOINT ["/bin/wrk"]
