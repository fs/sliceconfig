# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# add user
useradd -r -d /var/www/rails rails
usermod -G admin,rails,wheel admin

# add rails dirs
mkdir -p /var/www/rails /etc/rails/monit

# add rails logrotate
mkdir -p /etc/logrotate.d
copy_file $sliceconfig/config/etc/logrotate.d/rails /etc/logrotate.d/rails
