#!/bin/bash

# generating dir for user folder
function dwl_func_mkdir () {

    env_ext=`echo ${2} | awk '{print toupper($1)}'`;
    env_name="DWL_USER_DIR_${env_ext}";

    export ${env_name}=${1}/${2}
    echo "> Update ${env_name}=${!env_name}"

    if [ ! -d ${!env_name} ]; then
        mkdir -p ${!env_name};
        echo ">> Directory ${!env_name} created";
    else
        echo ">> Directory ${!env_name} already exists";
    fi

}

echo "> Functions uploaded";
