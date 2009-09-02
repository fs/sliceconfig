# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh

gem install --ignore-dependencies --no-rdoc --no-ri --no-update-sources -q $sliceconfig/install/files/gem_plugin-0.2.3.gem
gem install --ignore-dependencies --no-rdoc --no-ri --no-update-sources -q $sliceconfig/install/files/daemons-1.0.10.gem
gem install --ignore-dependencies --no-rdoc --no-ri --no-update-sources -q $sliceconfig/install/files/cgi_multipart_eof_fix-2.5.0.gem
gem install --ignore-dependencies --no-rdoc --no-ri --no-update-sources -q $sliceconfig/install/files/mongrel-1.1.5.gem
gem install --ignore-dependencies --no-rdoc --no-ri --no-update-sources -q $sliceconfig/install/files/mongrel_cluster-1.0.5.gem
