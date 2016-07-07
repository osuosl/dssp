FROM alanfranz/fwd-centos-6:latest
MAINTAINER support@osuosl.org
RUN yum -y install \
    automake \
    gcc \
    gcc-c++ \
    glibc \
    glibc-devel \
    glibc-static \
    make \
    tar \
    wget \
    zlib \
    zlib-devel \
    zlib-static \
    && yum clean all
RUN mkdir /dssp
WORKDIR /dssp
RUN wget http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz && \
    tar zxf bzip2-1.0.6.tar.gz
WORKDIR /dssp/bzip2-1.0.6
RUN mv Makefile Makefile.old && sed -e "/^CFLAGS/s/$/ -fPIC/" < Makefile.old > Makefile && make
RUN make install
WORKDIR /dssp
RUN rm -rf bzip2-1.0.6 bzip2-1.0.6.tar.gz
RUN wget http://downloads.sourceforge.net/project/boost/boost/1.57.0/boost_1_57_0.tar.gz && \
    tar zxf boost_1_57_0.tar.gz
WORKDIR /dssp/boost_1_57_0
RUN ./bootstrap.sh --without-libraries=python
RUN ./b2
RUN ./b2 install
WORKDIR /dssp
RUN rm -rf boost_1_57_0 boost_1_57_0.tar.gz
