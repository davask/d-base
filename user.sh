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

# declare extra user tmp dir
dwlExtraUserDirs=( "tmp" "log" );
for dir in "${dwlExtraUserDirs[@]}";
    dwl_func_mkdir ${DWL_USER_DIR} ${dir}
do
done;
unset dwlExtraUserDirs;

echo "##### END OF ${DWL_USER_NAME} INIT #####";
echo "";
