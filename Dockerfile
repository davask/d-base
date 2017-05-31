FROM davask/d-ubuntu:14.04
MAINTAINER davask <docker@davaskweblimited.com>
USER root
LABEL dwl.server.base="base u14.04"

# Update packages
RUN apt-get update
RUN apt-get install -y acl
RUN apt-get install -y apt-utils
RUN apt-get install -y binutils
RUN apt-get install -y build-essential
RUN apt-get install -y curl
RUN apt-get install -y expect
RUN apt-get install -y git
# FATAL ERROR: please install the following Perl modules before executing /usr/local/mysql/scripts/mysql_install_db:
# File::Basename
# File::Copy
# Sys::Hostname
# Data::Dumper
RUN apt-get install -y perl
RUN apt-get install -y unzip
RUN rm -rf /var/lib/apt/lists/*

COPY ./build/dwl/init.sh /dwl/init.sh
USER admin

