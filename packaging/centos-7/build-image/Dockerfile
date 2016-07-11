# This image contains all the tools necessary to build an RPM with fpm for Centos 7 using Docker.
FROM alanfranz/fwd-centos-7:latest
MAINTAINER support@osuosl.org
RUN yum -y install \
    gcc \
    gcc-c++ \
    glibc \
    glibc-devel \
    glibc-static \
    libstdc++-static \
    make \
    tar \
    wget \
    zlib \
    zlib-devel \
    zlib-static \
    && yum clean all
RUN mkdir /dssp
WORKDIR /dssp
# bzip must be built and installed to the image because bzip-devel does not have the static libraries.
RUN wget http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz && \
    tar zxf bzip2-1.0.6.tar.gz
WORKDIR /dssp/bzip2-1.0.6
RUN mv Makefile Makefile.old && sed -e "/^CFLAGS/s/$/ -fPIC/" < Makefile.old > Makefile && make
RUN make install
WORKDIR /dssp
RUN rm -rf bzip2-1.0.6 bzip2-1.0.6.tar.gz
# boost must also be built and installed for the same reason: boost-devel does not have static libraries.
RUN wget http://downloads.sourceforge.net/project/boost/boost/1.57.0/boost_1_57_0.tar.gz && \
    tar zxf boost_1_57_0.tar.gz
WORKDIR /dssp/boost_1_57_0
RUN ./bootstrap.sh --without-libraries=python
RUN ./b2
RUN ./b2 install
WORKDIR /dssp
RUN rm -rf boost_1_57_0 boost_1_57_0.tar.gz
