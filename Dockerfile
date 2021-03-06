FROM debian:10-slim AS builder

ENV PS2DEV /usr/local/ps2dev
ENV PATH $PATH:$PS2DEV/bin

RUN apt update \
 && apt install -y \
    gcc \
    git \
    make \
    libc-dev \
 && git clone https://github.com/ps2dev/ps2client.git \
 && mkdir -p $PS2DEV \
 && cd ps2client \
 && make clean \
 && make install

FROM debian:10-slim AS ps2runner

ENV PS2DEV /usr/local/ps2dev
ENV PATH $PATH:$PS2DEV/bin

COPY lirc/ /etc/lirc/

RUN apt update \
 && apt -o Dpkg::Options::=--force-confold install -y \
   lirc \
   wget \
   git

COPY --from=ps2dev/ps2dev /usr/local/ps2dev/ps2sdk/iop/irx/ /irx/
COPY --from=builder $PS2DEV $PS2DEV
COPY bin/ps2bootlink bin/ps2poweron bin/ps2poweroff bin/ps2run /usr/bin/
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "/usr/bin/ps2bootlink" ]
