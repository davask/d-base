FROM davask/d-ubuntu:16.04
MAINTAINER davask <contact@davaskweblimited.com>

# declare if by default we keep container running
ENV DWL_KEEP_RUNNING false

# declare main user
ENV DWL_USER_NAME dwl
ENV DWL_USER_PASSWD dwl
# declare superadmin group name
ENV DWL_GROUP_ADMIN superadmin
# declare default app dir
ENV DWL_APP_DIR files

# Declare user dir
ENV DWL_USER_DIR /home/$DWL_USER_NAME
# Declare user tmp dir
ENV DWL_USER_DIR_TMP $DWL_USER_DIR/tmp
# Declare user log dir
ENV DWL_USER_DIR_LOG $DWL_USER_DIR/log

# declare default WORKDIR
ENV DWL_WORKDIR $DWL_USER_DIR

# Declare instantiation type
ENV DWL_INIT base
# Declare instantiation counter
ENV DWL_INIT_COUNT 0
# Declare instantiation dir
ENV DWL_INIT_DIR /tmp/dwl-$DWL_INIT

# Declare instantiation conf files
COPY ./bash_conf /tmp/dwl-init
# Copy instantiation specific file
COPY ./base.sh $DWL_INIT_DIR/$DWL_INIT_COUNT-base.sh

RUN chmod 700 -R /tmp

# create new user
RUN useradd -ms /bin/bash $DWL_USER_NAME

# create superadmin group
RUN groupadd $DWL_GROUP_ADMIN;

# define superadmin permissions
RUN echo "$DWL_GROUP_ADMIN    ALL=(ALL:ALL) ALL" >> /etc/sudoers.d/$DWL_GROUP_ADMIN

# add superadmin group to user
RUN usermod -a -G $DWL_GROUP_ADMIN $DWL_USER_NAME;

USER $DWL_USER_NAME

WORKDIR $DWL_WORKDIR

# Start instantiation
CMD ["/tmp/dwl-init/conf.sh"]
