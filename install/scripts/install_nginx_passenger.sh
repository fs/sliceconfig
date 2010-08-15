# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh

gem install passenger --version=2.2.7
ln -s /opt/ruby-enterprise-1.8.7-2010.02 /opt/ree
cd /opt/ruby-enterprise-1.8.7-2010.02/lib/ruby/gems/1.8/gems/passenger-2.2.7
rake nginx
rpm -Uhv --force $sliceconfig/install/files/nginx-ree_1.8.7-passenger_2.2.7-0.6.36-1.x86_64.rpm
