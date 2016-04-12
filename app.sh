#!/bin/bash
echo "##### COMMON INITIALIZATION #####";

if [ "`dpkg-query -W -f='${Status}\n' sendmail | awk '{print $3}'`" = "installed" ]; then
    service sendmail start
    echo "> Sendmail Initialized";
fi

if [ -d /var/www ]; then

    if [ -d ${DWL_USER_DIR}/${DWL_APP_DIR} ]; then
        if [ -d /var/www/html ]; then
            rm -rdf /var/www/html
            echo "> Directory /var/www/html removed";
        fi
        ln -s ${DWL_USER_DIR}/${DWL_APP_DIR} /var/www/html
        chown :www-data -R /var/www/html
        find /var/www/html -type d -exec chmod 775 {} \;
        find /var/www/html -type f -exec chmod 664 {} \;

        echo "> Link ${DWL_USER_DIR}/${DWL_APP_DIR} to /var/www/html created";
    else
        echo "> Directory ${DWL_USER_DIR}/${DWL_APP_DIR} doesn't exists";
    fi

fi

echo "##### END OF COMMON INITIALIZATION #####";
echo "";