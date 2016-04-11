FROM davask/d-ubuntu:latest
MAINTAINER davask <contact@davaskweblimited.com>

# declare if by default we keep container running
ENV DWL_KEEP_RUNNING false


# declare main user
ENV DWL_USER_NAME dwl
RUN if [ "$DWL_USER_NAME" != "`cut -d: -f1 /etc/passwd | grep ^$DWL_USER_NAME$`" ]; then adduser --disabled-password --gecos "" $DWL_USER_NAME; else ls -la /home; fi

# declare user dir
ENV DWL_USER_DIR /home/$DWL_USER_NAME

# declare tmp dir
ENV DWL_TMP_DIR $DWL_USER_DIR/tmp
RUN test -d $DWL_TMP_DIR || mkdir -p $DWL_TMP_DIR

# Declare instantiation type
ENV DWL_INIT app

# Declare instantiation dir
ENV DWL_INIT_DIR $DWL_TMP_DIR/dwl-$DWL_INIT
RUN test -d "$DWL_INIT_DIR" || mkdir -p "$DWL_INIT_DIR"

# Declare instantiation counter
ENV DWL_INIT_COUNT 0

# Declare instantiation specific file
COPY ./base.sh $DWL_INIT_DIR/$DWL_INIT_COUNT-base.sh
RUN DWL_INIT_COUNT=$(($DWL_INIT_COUNT+1))

# Declare instantiation generic file
COPY ./dwl-init.sh $DWL_TMP_DIR/dwl-init.sh
RUN chmod 700 $DWL_TMP_DIR/dwl-init.sh

# declare volumes
VOLUME $DWL_USER_DIR

# Start instantiation
CMD $DWL_TMP_DIR/dwl-init.sh
