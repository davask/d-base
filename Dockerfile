FROM davask/d-ubuntu:latest
MAINTAINER davask <contact@davaskweblimited.com>

# declare main user
ENV DWL_USER_NAME dwl
RUN adduser --disabled-password --gecos "" $DWL_USER_NAME
ENV DWL_KEEP_RUNNING false

# declare volumes
ENV DWL_USER_DIR /home/$DWL_USER_NAME
VOLUME $DWL_USER_DIR
ENV DWL_TMP_DIR $DWL_USER_DIR/tmp
RUN test -d "$DWL_TMP_DIR" || mkdir -p "$DWL_TMP_DIR"

# Instantiate container
ENV DWL_INIT app
ENV DWL_INIT_DIR $DWL_TMP_DIR/dwl-$DWL_INIT
RUN test -d "$DWL_INIT_DIR" || mkdir -p "$DWL_INIT_DIR"
ENV DWL_INIT_COUNTER 0

COPY ./base.sh $DWL_INIT_DIR/$DWL_INIT_COUNTER-base.sh
RUN DWL_INIT_COUNTER=$(($DWL_INIT_COUNTER+1))

COPY ./dwl-init.sh $DWL_TMP_DIR/dwl-init.sh
RUN chmod 700 $DWL_TMP_DIR/dwl-init.sh

WORKDIR $DWL_INIT_DIR

CMD $DWL_TMP_DIR/dwl-init.sh
