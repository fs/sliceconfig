# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# create desc dir
mkdir -p /var/backups/mysql


# copy script
copy_file $sliceconfig/config/etc/cron.daily/automysqlbackup.sh /etc/cron.daily/automysqlbackup.sh

# restart service
service crond reload
