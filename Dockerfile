FROM davask/d-ubuntu:14.04
MAINTAINER davask <admin@davaskweblimited.com>
LABEL dwl.server.base="ubuntu 14.04"

# Update packages
RUN /bin/bash -c 'apt-get install -y apt-utils'
RUN /bin/bash -c 'apt-get install -y build-essential'
RUN /bin/bash -c 'apt-get install -y curl'
RUN /bin/bash -c 'apt-get install -y wget'
RUN /bin/bash -c 'apt-get install -y unzip'
RUN /bin/bash -c 'apt-get install -y git'
RUN /bin/bash -c 'apt-get install -y acl'
RUN /bin/bash -c 'rm -rf /var/lib/apt/lists/*'
