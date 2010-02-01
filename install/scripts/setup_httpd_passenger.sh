# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# link config
if [ "$1" == "8080" ]; then
    copy_file $sliceconfig/config/etc/httpd/conf/httpd-8080.conf /etc/httpd/conf/httpd.conf link
else
    copy_file $sliceconfig/config/etc/httpd/conf/httpd-80.conf /etc/httpd/conf/httpd.conf link
fi
exit
copy_file $sliceconfig/config/etc/httpd/conf.d/passenger.conf /etc/httpd/conf.d/passenger.conf link


# disable proxy_ajp
if [ -e /etc/httpd/conf.d/proxy_ajp.conf ]; then
  mv /etc/httpd/conf.d/proxy_ajp.conf /etc/httpd/conf.d/proxy_ajp.off
fi

# link vhosts structure
copy_file $sliceconfig/config/etc/httpd/conf.d/vhosts/* /etc/httpd/conf.d/vhosts/ link

# add worker
echo 'HTTPD=/usr/sbin/httpd.worker' >> /etc/sysconfig/httpd

# make mod_rpaf
tar xzvf $sliceconfig/install/files/mod_rpaf-0.6.tar.gz -C /tmp
ln -s /usr/sbin/apxs /usr/sbin/apxs2
cd /tmp/mod_rpaf-0.6
make rpaf-2.0 && make install-2.0
rm -rf /tmp/mod_rpaf-0.6

# configure service
chkconfig httpd on


# restart service
service httpd start
