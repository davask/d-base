# d-base
base container for all ubuntu base container

## Default ENV values

Define Default LANG LOCAL
> DWL_LOCAL en_US.UTF-8

## LABEL
dwl.server.os="ubuntu 16.04"

- - -

Force container to keep running
> DWL_KEEP_RUNNING false|true

Define username:passwd for ftp access
> DWL_USER_NAME dwl
> DWL_USER_PASSWD dwl

Define dirname to receive app files
> DWL_APP_DIR files
