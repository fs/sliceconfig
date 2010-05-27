# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# copy config
copy_file $sliceconfig/config/etc/yum/pluginconf.d/versionlock.conf /etc/yum/pluginconf.d/versionlock.conf
copy_file $sliceconfig/config/etc/yum/pluginconf.d/versionlock.list /etc/yum/pluginconf.d/versionlock.list