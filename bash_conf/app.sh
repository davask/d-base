#!/bin/bash
echo "> App initialization";

if [ "`dpkg-query -W -f='${Status}\n' sendmail | awk '{print $3}'`" = "installed" ]; then
    service sendmail start
    echo ">> Sendmail Initialized";
fi

chown -R ${DWL_USER_NAME}:${DWL_USER_NAME} ${DWL_USER_DIR}
echo ">> default chown executed";

find ${DWL_USER_DIR} -type d -exec chmod 775 {} \;
find ${DWL_USER_DIR} -type f -exec chmod 664 {} \;
echo ">> default chmod executed";

if [ -d /var/www ]; then

    if [ -d ${DWL_USER_DIR}/${DWL_APP_DIR} ]; then

        if [ -d /var/www/html ]; then
            rm -rdf /var/www/html
            echo ">> Directory /var/www/html removed";
        fi

        ln -s ${DWL_USER_DIR}/${DWL_APP_DIR} /var/www/html
        echo ">> Link ${DWL_USER_DIR}/${DWL_APP_DIR} to /var/www/html created";

        chown -R ${DWL_USER_NAME}:${APACHE_RUN_GROUP} ${DWL_USER_DIR}/${DWL_APP_DIR}
        chown -R ${DWL_USER_NAME}:${DWL_USER_NAME} ${DWL_USER_DIR}
        echo ">> app chown executed";

        find ${DWL_USER_DIR}/${DWL_APP_DIR} -type d -exec chmod 775 {} \;
        find ${DWL_USER_DIR}/${DWL_APP_DIR} -type f -exec chmod 664 {} \;
        echo ">> app chmod executed";

    else

        echo ">> Directory ${DWL_USER_DIR}/${DWL_APP_DIR} doesn't exists";

    fi

fi

echo "> App uploaded";
echo "";
