# keeping duplicated Dockerfiles for now, until dockerhub upgrades to 1.9
# ARG CODE_VERSION 3.6
FROM arm64v8/alpine:3.5
## Switch to arm64 base image.. 
### add new emu...
ADD https://github.com/multiarch/qemu-user-static/releases/download/v2.9.1/x86_64_qemu-aarch64-static.tar.gz /
ENV QEMU_EXECVE 1

COPY . /usr/bin

RUN [ "qemu-aarch64-static", "/bin/sh", "-c", "ln -s resin-xbuild /usr/bin/cross-build-start; ln -s resin-xbuild /usr/bin/cross-build-end; ln /bin/sh /bin/sh.real" ]
