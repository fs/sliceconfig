# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# create config dir
mkdir /etc/s3conf /etc/s3conf/certs


# copy config
copy_file $sliceconfig/config/etc/s3conf/s3config.yml /etc/s3conf/s3config.yml


# create s3 bucket for host
s3cmd createbucket $HOSTNAME

# copy certs
cp -f $sliceconfig/config/etc/s3conf/certs/* /etc/s3conf/certs/


# copy sysconfig
copy_file $sliceconfig/config/etc/sysconfig/s3sync /etc/sysconfig/s3sync


# copy script
copy_file $sliceconfig/config/etc/cron.daily/0s3sync.sh /etc/cron.daily/0s3sync.sh


# restart service
service crond reload
