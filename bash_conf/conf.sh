#!/bin/bash
. /tmp/dwl-init/functions.sh

. /tmp/dwl-init/user.sh

. /tmp/dwl-init/app.sh

chmod -R 700 ${DWL_INIT_DIR}
echo "##### LIST OF ${DWL_INIT_DIR} #####";
ls -lah ${DWL_INIT_DIR} | sort -r;
echo "##### END OF LIST OF ${DWL_INIT_DIR} #####";
echo "";

echo "##### START INITIALIZATION #####";
for init in `ls ${DWL_INIT_DIR} | sort -r`;
do
    echo "> Initialization of ${DWL_INIT_DIR}/${init}";
    . ${DWL_INIT_DIR}/${init};
done;

#todo : add log + sendmail + create screenshot
# src : https://github.com/blueimp/cron/blob/master/crontab
# src : https://github.com/blueimp/container-tools
for func in `typeset -f | awk '/ \(\) $/ && !/^main / {print $1}' | grep dwl_func_`;
do
    echo "${func}"
    # unset -f ${func}
done;

echo "##### END OF INITIALIZATION #####";
echo "";

echo "> ACCESS WORKDIR ${DWL_USER_DIR}";
cd ${DWL_USER_DIR}

# echo "> SWITCH TO USER ${DWL_USER_NAME}";
# su ${DWL_USER_NAME}

if [ "${DWL_INIT}" = "app" ] || [ "${DWL_KEEP_RUNNING}" = "true" ]; then
    echo "> KEEP APP ACTIVE";
    echo "";
    tail -f /dev/null;
else
    echo "";
fi
# auto remove file
rm -- "$0";