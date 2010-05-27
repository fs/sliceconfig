# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# copy config
copy_file $sliceconfig/config/etc/httpd/conf/httpd-80.conf /etc/httpd/conf/httpd.conf

# disable proxy_ajp
if [ -e /etc/httpd/conf.d/proxy_ajp.conf ]; then
  mv /etc/httpd/conf.d/proxy_ajp.conf /etc/httpd/conf.d/proxy_ajp.off
fi


# copy vhosts configs
copy_file $sliceconfig/config/etc/httpd/conf.d/vhosts/localhost.conf /etc/httpd/conf.d/
copy_file $sliceconfig/config/etc/httpd/conf.d/vhosts/__0default.conf /etc/httpd/conf.d/

# configure service
chkconfig httpd on

# restart service
service httpd start
