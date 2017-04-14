#/usr/bin/env bash

branch=${1};
parentBranch=${2};
rootDir=${3};
buildDir=${4};

######################
# docker-compose.yml #
######################

echo '[
  {
    "title": "Base u14.04",
    "description": "Ubuntu 14.04 pre-configured",
    "logo": "http://www.omgubuntu.co.uk/trusty/assets/tahr.png",
    "image": "davask/d-base:d-14.04",
    "ports": [
      "22/tcp"
    ],
    "env": [
      {
        "name": "DWL_LOCAL_LANG",
        "label": "Local lang [en_US:en]"
      },
      {
        "name": "DWL_LOCAL",
        "label": "Local [en_US.UTF-8]"
      },
      {
        "name": "DWL_USER_NAME",
        "label": "Username [username]"
      },
      {
        "name": "DWL_SSH_ACCESS",
        "label": "Enable ssh access [false]"
      },
      {
        "name": "DWL_USER_ID",
        "label": "User id [1000]"
      },
      {
        "name": "DWL_USER_PASSWD",
        "label": "User password for ssh access [secret]"
      },
      {
        "name": "DWL_KEEP_RUNNING",
        "label": "Keep container running [true]"
      }
    ],
    "volumes": ["/home/username"]
  }
]
' >> ${rootDir}/portainer-template.json