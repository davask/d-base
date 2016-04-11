FROM davask/d-ubuntu:latest
MAINTAINER davask <contact@davaskweblimited.com>

# declare if by default we keep container running
ENV DWL_KEEP_RUNNING false
# declare main user
ENV DWL_USER_NAME dwl

# Declare user dir
ENV DWL_USER_DIR /home/$DWL_USER_NAME
# Declare user tmp dir
ENV DWL_USER_DIR_TMP $DWL_USER_DIR/tmp

# Declare instantiation type
ENV DWL_INIT app
# Declare instantiation counter
ENV DWL_INIT_COUNT 0


# Declare instantiation dir
ENV DWL_INIT_DIR /tmp/dwl-$DWL_INIT
# Copy instantiation specific file
COPY ./base.sh $DWL_INIT_DIR/$DWL_INIT_COUNT-base.sh
# update counter for next container
RUN DWL_INIT_COUNT=$(($DWL_INIT_COUNT+1))

# Declare instantiation generic file
COPY ./user.sh /tmp/dwl-init-user.sh
RUN chmod 700 /tmp/dwl-init-user.sh
COPY ./dwl-init.sh /tmp/dwl-init.sh
RUN chmod 700 /tmp/dwl-init.sh

# Start instantiation
CMD ["/tmp/dwl-init.sh"]
