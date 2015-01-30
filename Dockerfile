FROM centos:6

MAINTAINER OSU OSL support@osuosl.org

RUN yum -y update
RUN yum clean all
RUN yum -y install gcc gcc-c++ glibc glibc-devel glibc-static zlib zlib-devel zlib-static wget tar rpm-build ruby-gems

RUN wget --quiet http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz
RUN tar xzf bzip2-1.0.6.tar.gz
RUN cd bzip2-1.0.6 && make && make install

RUN wget --quiet http://downloads.sourceforge.net/project/boost/boost/1.57.0/boost_1_57_0.tar.gz
RUN tar zxf boost_1_57_0.tar.gz

WORKDIR /opt/dssb
COPY . /opt/dssb
RUN make
