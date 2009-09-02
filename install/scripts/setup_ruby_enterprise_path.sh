# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# symlink config
copy_file $sliceconfig/config/etc/profile.d/ruby_enterprise_path.sh /etc/profile.d/ruby_enterprise_path.sh copy