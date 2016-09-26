FROM davask/d-ubuntu:14.04
MAINTAINER davask <docker@davaskweblimited.com>
LABEL dwl.server.base="ubuntu 14.04"

ENV GOSU_VERSION 1.7

# Update packages
RUN /bin/bash -c 'apt-get update;'
RUN /bin/bash -c 'apt-get install -y acl'
RUN /bin/bash -c 'apt-get install -y apt-utils'
RUN /bin/bash -c 'apt-get install -y binutils'
RUN /bin/bash -c 'apt-get install -y build-essential'
RUN /bin/bash -c 'apt-get install -y curl'
RUN /bin/bash -c 'apt-get install -y expect'
RUN /bin/bash -c 'apt-get install -y git'
# FATAL ERROR: please install the following Perl modules before executing /usr/local/mysql/scripts/mysql_install_db:
# File::Basename
# File::Copy
# Sys::Hostname
# Data::Dumper
RUN /bin/bash -c 'apt-get install -y perl'
RUN /bin/bash -c 'apt-get install -y python-software-properties'
RUN /bin/bash -c 'apt-get install -y unzip'
RUN /bin/bash -c 'rm -rf /var/lib/apt/lists/*'

COPY ./tmp/dwl/init.sh /tmp/dwl/init.sh
