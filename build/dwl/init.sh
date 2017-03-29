#! /bin/bash

dwlDir="/dwl";

. ${dwlDir}/envvar.sh
. ${dwlDir}/user.sh
. ${dwlDir}/ssh.sh
echo ">> Ubuntu initialized";

echo ">> Base initialized";

. ${dwlDir}/permission.sh
echo ">> permission assigned";

. ${dwlDir}/keeprunning.sh
