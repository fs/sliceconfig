# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh

gem install --ignore-dependencies --no-rdoc --no-ri --no-update-sources -q passenger --version=`get_value 'CONFIG_PASSENGER_VERSION'`
ln -s /opt/ruby-enterprise-1.8.7-2010.02/ /opt/ree
/opt/ree/bin/passenger-install-apache2-module