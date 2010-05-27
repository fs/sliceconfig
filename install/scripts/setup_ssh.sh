# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# copy config
copy_file $sliceconfig/config/etc/ssh/sshd_config /etc/ssh/sshd_config

# modify sshd default config
if [ $CONFIG_ALLOW_ROOT_LOGIN="yes" ]; then
    sed -i -e "s#AllowUsers admin#AllowUsers admin root#" /etc/ssh/sshd_config
fi


# configure service
chkconfig sshd on


# reload service
service sshd restart
