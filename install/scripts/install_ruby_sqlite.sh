# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh

yum -y -d1 install sqlite.x86_64 sqlite-devel.x86_64

gem install --ignore-dependencies --no-rdoc --no-ri --no-update-sources -q $sliceconfig/install/files/sqlite3-ruby-1.2.2.gem 

# fixup gem perms
# http://github.com/FooBarWidget/rubyenterpriseedition/commit/097d2f3c22848470311bf6b5facac0a49e03b4ca
find /opt/ruby-enterprise-1.8.7-2010.02/lib/ruby/gems/1.8/gems -perm 0662 -exec chmod 664 {} \;
