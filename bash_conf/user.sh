#!/bin/bash

echo "> User "${DWL_USER_NAME}" INIT";
if [ "${DWL_USER_NAME}" != "`cut -d: -f1 /etc/passwd | grep ^${DWL_USER_NAME}$`" ]; then
    adduser --disabled-password --no-create-home --gecos "" ${DWL_USER_NAME};
    # echo -e "${DWL_USER_PASSWD}\n${DWL_USER_PASSWD}" | (passwd ${DWL_USER_NAME})
   echo ">> ${DWL_USER_NAME} created !";
else
   echo ">> ${DWL_USER_NAME} already exists !";
fi

# declare user dir
export DWL_USER_DIR=/home/${DWL_USER_NAME}
echo "> update DWL_USER_DIR > ${DWL_USER_DIR}"

# declare extra user tmp dir
dwlExtraUserDirs=( "tmp" "log" );
for dir in "${dwlExtraUserDirs[@]}";
do
    dwl_func_mkdir ${DWL_USER_DIR} ${dir}
done;
unset dwlExtraUserDirs;

echo "> User uploaded";
echo "";
