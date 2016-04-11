#!/bin/bash
echo "##### ${DWL_USER_NAME} INIT #####";
/tmp/dwl-init-user.sh;
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
    echo ">>>>> Initialization of ${DWL_INIT_DIR}/${init} <<<<<";
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
