FROM debian:trixie

RUN apt update
RUN apt install -y adduser sudo vim tree curl wget procps git
RUN useradd -m -s /bin/bash bob && echo "bob:bob" | chpasswd && usermod -aG sudo bob
WORKDIR /home/bob
USER bob

