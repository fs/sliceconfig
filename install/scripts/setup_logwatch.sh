# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# link config
copy_file $sliceconfig/config/etc/logwatch/conf/logwatch.conf /etc/logwatch/conf/logwatch.conf link
mv /etc/cron.daily/0logwatch /etc/cron.weekly/
