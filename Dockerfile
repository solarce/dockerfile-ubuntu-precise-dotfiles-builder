FROM ubuntu:precise

MAINTAINER Brandon Burton <brandon@inatree.org>

ENV BUILD_DIR /usr/local/build
ENV DEBIAN_FRONTEND noninteractive

# Install packages needed to run build scripts and pkgsrc
RUN apt-get update -yqq
RUN apt-get --quiet --yes install ruby1.9.1-full
RUN apt-get --quiet --yes install curl
RUN apt-get --quiet --yes install build-essential libncurses-dev git
RUN gem install bundler --no-ri --no-rdoc

# Setup pkgsrc
# Steps modified from http://www.codeghar.com/blog/pkgsrc-on-linux-quickstart-guide.html
RUN mkdir -p $BUILD_DIR
WORKDIR $BUILD_DIR
RUN git clone https://github.com/jsonn/pkgsrc.git
RUN cd $BUILD_DIR/pkgsrc/bootstrap/
ENV SH /bin/bash
RUN ./bootstrap --unprivileged
RUN cd $BUILD_DIR/pkgsrc/pkgtools/pkg_install && $BUILD_DIR/pkg/bin/bmake install clean clean-depends
RUN cd $BUILD_DIR/pkgsrc/pkgtools/pkg_rolling-replace && $BUILD_DIR/pkg/bin/bmake install clean clean-depends
RUN cd $BUILD_DIR/pkgsrc/pkgtools/pkg_chk && $BUILD_DIR/pkg/bin/bmake install clean clean-depends
