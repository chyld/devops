FROM debian:trixie

RUN apt update
RUN apt install -y adduser sudo vim tree curl wget procps git
RUN adduser --disabled-password --comment " " bob
RUN adduser bob sudo
WORKDIR /home/bob
USER bob

