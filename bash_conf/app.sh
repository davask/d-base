#!/bin/bash
echo "> Common initialization #####";

if [ "`dpkg-query -W -f='${Status}\n' sendmail | awk '{print $3}'`" = "installed" ]; then
    service sendmail start
    echo ">> Sendmail Initialized";
fi

if [ -d /var/www ]; then

    if [ -d ${DWL_USER_DIR}/${DWL_APP_DIR} ]; then
        if [ -d /var/www/html ]; then
            rm -rdf /var/www/html
            echo ">> Directory /var/www/html removed";
        fi
        chown -R ${DWL_USER_NAME}:${APACHE_RUN_GROUP} ${DWL_USER_DIR}
        find ${DWL_USER_DIR}/${DWL_APP_DIR} -type d -exec chmod 775 {} \;
        find ${DWL_USER_DIR}/${DWL_APP_DIR} -type f -exec chmod 664 {} \;
        ln -s ${DWL_USER_DIR}/${DWL_APP_DIR} /var/www/html

        echo ">> Link ${DWL_USER_DIR}/${DWL_APP_DIR} to /var/www/html created";
    else
        echo ">> Directory ${DWL_USER_DIR}/${DWL_APP_DIR} doesn't exists";
    fi

fi

echo "> App uploaded";
echo "";
