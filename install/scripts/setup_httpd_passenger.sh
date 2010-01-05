# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# link config
copy_file $sliceconfig/config/etc/httpd/conf/httpd-8080.conf /etc/httpd/conf/httpd.conf link
copy_file $sliceconfig/config/etc/httpd/conf.d/passenger.conf /etc/httpd/conf.d/passenger.conf link


# disable proxy_ajp
if [ -e /etc/httpd/conf.d/proxy_ajp.conf ]; then
  mv /etc/httpd/conf.d/proxy_ajp.conf /etc/httpd/conf.d/proxy_ajp.off
fi

# make mod_rpaf
tar xzvf $sliceconfig/install/files/mod_rpaf-0.6.tar.gz -C /tmp
cd /tmp/mod_rpaf-0.6
make && make install
rm -rf /tmp/mod_rpaf-0.6

# link vhosts structure
copy_file $sliceconfig/config/etc/httpd/conf.d/vhosts/* /etc/httpd/conf.d/vhosts/ link

# add worker
echo 'HTTPD=/usr/sbin/httpd.worker' >> /etc/sysconfig/httpd

# configure service
chkconfig httpd on


# restart service
service httpd start
