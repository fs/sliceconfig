# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved

# Migrating forom standart ruby to the ruby enterprise edition


# sliceconfig dir
sliceconfig=`dirname $0`/../..
sliceconfig=`readlink -f $sliceconfig`


# remove ruby rpms
yum -y erase ruby ruby-libs


# remove RubyWorks repo
rm -f /etc/yum.repos.d/RubyWorks.repo


# install deps & Enterprise Ruby
sh $sliceconfig/install/scripts/install_tools_build.sh
sh $sliceconfig/install/scripts/install_ruby_enterprise.sh
sh $sliceconfig/install/scripts/setup_ruby_enterprise_path.sh


# update all gems
sh $sliceconfig/install/scripts/setup_s3sync.sh
