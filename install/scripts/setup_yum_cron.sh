# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved

# include config
. `dirname $0`/configuration.sh

# configure service yum cron
chkconfig yum-cron off
copy_file $sliceconfig/config/etc/sysconfig/yum-cron /etc/sysconfig/yum-cron

# start yum-cron
service yum-cron start

