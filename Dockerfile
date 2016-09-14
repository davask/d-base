FROM davask/d-ubuntu:16.04
MAINTAINER davask <contact@davaskweblimited.com>

# declare if by default we keep container running
ENV DWL_KEEP_RUNNING false

# declare main user
ENV DWL_USER_NAME dwl
ENV DWL_USER_PASSWD dwl
# declare default app dir
ENV DWL_APP_DIR files

# Declare user dir
ENV DWL_USER_DIR /home/$DWL_USER_NAME
# Declare user tmp dir
ENV DWL_USER_DIR_TMP $DWL_USER_DIR/tmp
# Declare user log dir
ENV DWL_USER_DIR_LOG $DWL_USER_DIR/log

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

WORKDIR $DWL_USER_DIR

# Start instantiation
CMD ["/tmp/dwl-init/conf.sh"]
