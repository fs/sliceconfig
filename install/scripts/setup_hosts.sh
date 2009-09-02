# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# link config
copy_file $sliceconfig/config/etc/hosts.allow /etc/hosts.allow link
copy_file $sliceconfig/config/etc/hosts.deny /etc/hosts.deny link
