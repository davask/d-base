#!/bin/bash
echo ">>>>> INIT ${DWL_USER_NAME} <<<<<";
/tmp/dwl-init-user.sh;

chmod -R 700 ${DWL_INIT_DIR}
echo ">>>>> LIST /TMP INITIALIZATION FILES <<<<<";
ls -lah ${DWL_INIT_DIR} | sort -r;
echo "";

echo "##### START INITIALIZATION #####";
for init in `ls ${DWL_INIT_DIR} | sort -r`;
do
    echo ">>>>> Initialization of ${DWL_INIT_DIR}/${init} <<<<<";
    ${DWL_INIT_DIR}/${init};
    echo "";
done;
echo "##### END OF INITIALIZATION #####";
echo "";

echo ">>>>> ACCESS WORKDIR ${DWL_USER_DIR} <<<<<";
cd ${DWL_USER_DIR}

echo ">>>>> SWITCH TO USER ${DWL_USER_NAME} <<<<<";
su ${DWL_USER_NAME}
echo "";

if [ "${DWL_INIT}" = "app" ] || [ "${DWL_KEEP_RUNNING}" = "true" ]; then
    echo ">>>>> KEEP APP ACTIVE <<<<<";
    tail -f /dev/null;
fi
