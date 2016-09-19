# dockerfile

## Default ENV values

### Define Default LANG LOCAL
> DWL_LOCAL en_US.UTF-8

### Define username:passwd for ssh access
> DWL_USER_NAME dwl

> DWL_USER_PASSWD dwl

### Define if ssh accept and sftp are accepted
> ENV DWL_SSH_ACCESS false

## LABEL

> dwl.server.os="ubuntu 14.04"
