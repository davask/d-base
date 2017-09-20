FROM davask/d-ubuntu:16.04
MAINTAINER davask <docker@davaskweblimited.com>
USER root
LABEL dwl.server.base="base u16.04"

# Update packages
RUN apt-get update && \
apt-get install -y \
acl \
apt-utils \
binutils \
build-essential \
cron \
curl \
expect \
git \
perl \
htop \
unzip
RUN apt-get upgrade -y && \
apt-get autoremove -y && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./build/dwl/custom.sh \
./build/dwl/init.sh \
/dwl/
RUN chmod +x /dwl/init.sh && chown root:sudo -R /dwl
USER admin
