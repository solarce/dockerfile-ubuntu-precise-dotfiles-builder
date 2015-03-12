# Ubuntu Precise full with pkgsrc bootstrapped into /home/ubuntu
FROM solarce/dockerfile-ubuntu-precise-full:latest

MAINTAINER Brandon Burton <brandon@inatree.org>

ENV DEBIAN_FRONTEND noninteractive

# Setup pkgsrc
# Steps modified from http://www.codeghar.com/blog/pkgsrc-on-linux-quickstart-guide.html
RUN adduser --shell /bin/bash --gecos "User for builds" --disabled-password --home /home/ubuntu ubuntu
RUN apt-get --quiet --yes install sudo
ADD bootstrap.sh /tmp/
RUN bash -x /tmp/bootstrap.sh
#RUN cd $BUILD_DIR/pkgsrc/pkgtools/pkg_install && $BUILD_DIR/pkgsrc_install/bin/bmake install clean clean-depends
#RUN cd $BUILD_DIR/pkgsrc/pkgtools/pkg_rolling-replace && $BUILD_DIR/pkg/bin/bmake install clean clean-depends
#RUN cd $BUILD_DIR/pkgsrc/pkgtools/pkg_chk && $BUILD_DIR/pkg/bin/bmake install clean clean-depends
