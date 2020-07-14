FROM alpine AS builder

ENV PS2DEV /usr/local/ps2dev
ENV PATH $PATH:$PS2DEV/bin

RUN apk --update --no-cache add \
    gcc \
    git \
    make \
    musl-dev \
 && git clone https://github.com/ps2dev/ps2client.git \
 && mkdir -p $PS2DEV \
 && cd ps2client \
 && make clean \
 && make install

FROM alpine

ENV PS2DEV /usr/local/ps2dev
ENV PATH $PATH:$PS2DEV/bin

COPY --from=builder $PS2DEV $PS2DEV
