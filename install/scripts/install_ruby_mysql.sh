# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh

gem install --ignore-dependencies --no-rdoc --no-ri --no-update-sources -q $sliceconfig/install/files/mysql-2.7.gem  -- --with-mysql-include=/usr/include/mysql --with-mysql-lib=/usr/lib64/mysql
