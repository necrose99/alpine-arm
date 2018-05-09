# keeping duplicated Dockerfiles for now, until dockerhub upgrades to 1.9
# ARG CODE_VERSION 3.6
FROM arm64v8/alpine
## Switch to arm64 base image.. 
### add new emu...
ENV QEMU_EXECVE 1
COPY bin/ /usr/bin/
#COPY . /usr/bin
##ADD https://github.com/resin-io/qemu/releases/download/v2.9.0%2Bresin1/qemu-2.9.0.resin1-aarch64.tar.gz /usr/bin/
## update qemu...  added to .bin

RUN [ "/usr/bin/qemu-arm64-static", "/bin/sh", "-c", "ln -s resin-xbuild /usr/bin/cross-build-start; ln -s resin-xbuild /usr/bin/cross-build-end; ln /bin/sh /bin/sh.real" ]
