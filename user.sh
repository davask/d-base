#!/bin/bash

echo "##### ${DWL_USER_NAME} INIT #####";
if [ "${DWL_USER_NAME}" != "`cut -d: -f1 /etc/passwd | grep ^${DWL_USER_NAME}$`" ]; then
    adduser --disabled-password --no-create-home --gecos "" ${DWL_USER_NAME};
   echo "${DWL_USER_NAME} created !";
else
   echo "${DWL_USER_NAME} already exists !";
fi

# declare user dir
export DWL_USER_DIR=/home/${DWL_USER_NAME}
echo "update DWL_USER_DIR > ${DWL_USER_DIR}"

# declare tmp dir
export DWL_USER_DIR_TMP=${DWL_USER_DIR}/tmp
echo "update DWL_USER_DIR_TMP > ${DWL_USER_DIR_TMP}"
if [ ! -d ${DWL_USER_DIR_TMP} ]; then
    mkdir -p ${DWL_USER_DIR_TMP};
    echo 'Directory ${DWL_USER_DIR_TMP} created';
else
    echo "Directory ${DWL_USER_DIR_TMP} already exists";
fi

# declare tmp log
export DWL_USER_DIR_LOG=${DWL_USER_DIR}/log
echo "update DWL_USER_DIR_LOG > ${DWL_USER_DIR_LOG}"
if [ ! -d ${DWL_USER_DIR_LOG} ]; then
    mkdir -p ${DWL_USER_DIR_LOG};
    echo 'Directory ${DWL_USER_DIR_LOG} created';
else
    echo "Directory ${DWL_USER_DIR_LOG} already exists";
fi
echo "##### END OF ${DWL_USER_NAME} INIT #####";
echo "";
