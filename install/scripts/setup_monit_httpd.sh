# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# link config
copy_file $sliceconfig/config/etc/monit.d/httpd.conf /etc/monit.d/httpd.conf link
copy_file $sliceconfig/config/etc/init.d/httpd_fs /etc/init.d/httpd_fs copy


# reload monit
monit reload
