#!/bin/bash
echo "##### ${DWL_USER_NAME} INIT #####";
if [ "${DWL_USER_NAME}" != "`cut -d: -f1 /etc/passwd | grep ^${DWL_USER_NAME}$`" ]; then
    adduser --disabled-password --gecos "" ${DWL_USER_NAME};
   echo "${DWL_USER_NAME} created !";
else
   echo "${DWL_USER_NAME} already exists !";
fi

# declare user dir
DWL_USER_DIR=/home/${DWL_USER_NAME}
# declare tmp dir
DWL_USER_DIR_TMP=${DWL_USER_DIR}/tmp
test -d ${DWL_USER_DIR_TMP} || mkdir -p ${DWL_USER_DIR_TMP}
echo "##### END OF ${DWL_USER_NAME} INIT #####";
echo "";

chmod -R 700 ${DWL_INIT_DIR}
echo "##### LIST OF ${DWL_INIT_DIR} #####";
ls -lah ${DWL_INIT_DIR} | sort -r;
echo "##### END OF LIST OF ${DWL_INIT_DIR} #####";
echo "";

echo "##### START INITIALIZATION #####";
for init in `ls ${DWL_INIT_DIR} | sort -r`;
do
    echo "> Initialization of ${DWL_INIT_DIR}/${init}";
    ${DWL_INIT_DIR}/${init};
done;
echo "##### END OF INITIALIZATION #####";
echo "";

echo "> ACCESS WORKDIR ${DWL_USER_DIR}";
cd ${DWL_USER_DIR}

echo "> SWITCH TO USER ${DWL_USER_NAME}";
su ${DWL_USER_NAME}

if [ "${DWL_INIT}" = "app" ] || [ "${DWL_KEEP_RUNNING}" = "true" ]; then
    echo "> KEEP APP ACTIVE";
    tail -f /dev/null;
fi
