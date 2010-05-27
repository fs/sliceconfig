# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh

# create log dir
mkdir /var/log/ssh

# copy config
copy_file $sliceconfig/config/etc/profile.d/ssh_logger.sh /etc/profile.d/ssh_logger.sh
