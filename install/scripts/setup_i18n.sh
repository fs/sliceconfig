# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# copy config
copy_file $sliceconfig/config/etc/sysconfig/i18n /etc/sysconfig/i18n


# setup locale
export LC_ALL="en_US.UTF-8"
