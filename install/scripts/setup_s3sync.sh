# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# create config dir
mkdir /etc/s3conf /etc/s3conf/certs


# link config
copy_file $sliceconfig/config/etc/s3conf/s3config.yml /etc/s3conf/s3config.yml link


# create s3 bucket for host
s3cmd createbucket $HOSTNAME

# copy certs
cp -f $sliceconfig/config/etc/s3conf/certs/* /etc/s3conf/certs/


# link sysconfig
copy_file $sliceconfig/config/etc/sysconfig/s3sync /etc/sysconfig/s3sync link


# link script
copy_file $sliceconfig/config/etc/cron.daily/0s3sync.sh /etc/cron.daily/0s3sync.sh link


# restart service
service crond reload
