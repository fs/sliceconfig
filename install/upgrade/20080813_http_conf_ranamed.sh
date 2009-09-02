# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# sliceconfig dir
sliceconfig=`dirname $0`/../..
sliceconfig=`readlink -f $sliceconfig`


# relink httpd conf
rm -f /etc/httpd/conf/httpd.conf
ln -s $sliceconfig/conf/etc/httpd/conf/httpd-80.conf /etc/httpd/conf/httpd.conf
