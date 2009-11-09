# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh

gem install --ignore-dependencies --no-rdoc --no-ri --no-update-sources -q $sliceconfig/install/files/passenger-2.2.5.gem
passenger-install-apache2-module
