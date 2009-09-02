# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# copy config
copy_file $sliceconfig/config/etc/sudoers /etc/sudoers copy

# setup perms
chmod 0440 /etc/sudoers
