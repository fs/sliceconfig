# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# copy config
copy_file $sliceconfig/config/etc/monit.d/nginx.conf /etc/monit.d/nginx.conf
copy_file $sliceconfig/config/etc/init.d/nginx_fs /etc/init.d/nginx_fs

# reload monit
monit reload
