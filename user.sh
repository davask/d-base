#!/bin/bash

if [ "$DWL_USER_NAME" != "`cut -d: -f1 /etc/passwd | grep ^$DWL_USER_NAME$`" ]; then
    adduser --disabled-password --gecos "" $DWL_USER_NAME;
   echo "$DWL_USER_NAME created !";
else
   echo "$DWL_USER_NAME already exists !";
fi

# declare user dir
export DWL_USER_DIR=/home/$DWL_USER_NAME
# declare tmp dir
export DWL_TMP_DIR=$DWL_USER_DIR/tmp
test -d $DWL_TMP_DIR || mkdir -p $DWL_TMP_DIR
