FROM ubuntu:precise

MAINTAINER Brandon Burton <brandon@inatree.org>

ENV BUILD_DIR /usr/local/build
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -yqq
RUN apt-get --quiet --yes install ruby1.9.1-full
RUN apt-get --quiet --yes install curl
RUN gem install bundler > /dev/null 2>&1

ENTRYPOINT ["/bin/true"]
