# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# create config dir
mkdir /etc/s3conf /etc/s3conf/certs


# copy config
copy_file $sliceconfig/config/etc/s3conf/s3config.yml /etc/s3conf/s3config.yml

#copy binaries to /usr/bin
copy_file /opt/ruby-enterprise-1.8.7-2010.02/bin/s3cmd /usr/bin/s3cmd
copy_file /opt/ruby-enterprise-1.8.7-2010.02/bin/s3sync /usr/bin/s3sync

# create s3 bucket for host
s3cmd createbucket $HOSTNAME

# copy certs
cp -f $sliceconfig/config/etc/s3conf/certs/* /etc/s3conf/certs/


# copy sysconfig
copy_file $sliceconfig/config/etc/sysconfig/s3sync /etc/sysconfig/s3sync


# copy script
copy_file $sliceconfig/config/etc/cron.daily/0s3sync.sh /etc/cron.daily/0s3sync.sh
copy_file $sliceconfig/config/etc/cron.daily/s3-remove.sh /etc/cron.daily/s3-remove.sh


# restart service
service crond reload
