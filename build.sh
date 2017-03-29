#/usr/bin/env bash

branch=${1};
parentBranch=${branch/u/};

if [[ "${1}" != "u12.04" ]] && [[ "${1}" != "u14.04" ]] && [[ "${1}" != "u16.04" ]]; then

    echo "Base available: u12.04, u14.04, u16.04"
    exit 0;

fi

thisDir=`readlink -m "${PWD}"`;
rootDir="${thisDir}";
buildDir=`readlink -m "${thisDir}/build"`;

. ./script/Dockerfile.sh ${branch} ${parentBranch} ${rootDir} ${buildDir}
. ./script/README.sh ${branch} ${parentBranch} ${rootDir} ${buildDir}
. ./script/docker-compose.sh ${branch} ${parentBranch} ${rootDir} ${buildDir}

sudo docker build -t davask/d-base:${branch} ${thisDir};

echo "sudo docker run --name d-base -tdi -p 65502:22/tcp -e DWL_KEEP_RUNNING=true --label io.rancher.scheduler.affinity:host_label=dwl=dwlComPrivate davask/d-base:${branch}";
echo "http://public.ginkgo-migration.com:6408/env/1a5/apps/add-service?environmentId=&containerId=";

exit 1;
