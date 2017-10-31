FROM ubuntu:14.04

RUN dpkg --add-architecture i386 && \
apt-get update && apt-get -y install build-essential vim-common wget git bzip2 make python libc6:i386 astyle clang && \
wget http://www.ac6-tools.com/downloads/SW4STM32/install_sw4stm32_linux_64bits-latest.run && \
mkdir -p /usr/local/SystemWorkbench/