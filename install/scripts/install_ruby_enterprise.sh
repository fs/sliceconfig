# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved

# include config
. `dirname $0`/configuration.sh


# install ruby 
yum -y -d1 localinstall --nogpgcheck $sliceconfig/install/files/ruby-libs-1.8.6.111-1.x86_64.rpm $sliceconfig/install/files/ruby-1.8.6.111-1.x86_64.rpm


# install additional devel libs
yum -y -d1 install zlib-devel.x86_64 openssl-devel.x86_64 readline-devel.x86_64


# install ruby ent
tar xzf $sliceconfig/install/files/ruby-enterprise-1.8.6-20090610.tar.gz -C /tmp
cd /tmp/ruby-enterprise-1.8.6-20090610
sh ./installer --auto /opt/ruby-enterprise-1.8.6-20090610
rm -rf /tmp/ruby-enterprise-1.8.6-20090610

# erase ruby
yum -y erase ruby.x86_64 ruby-libs.x86_64


# add direcotry to PATH
. $sliceconfig/config/etc/profile.d/ruby_enterprise_path.sh


# symlink ruby
copy_file /opt/ruby-enterprise-1.8.6-20090610/bin/ruby /usr/bin/ruby link
copy_file /opt/ruby-enterprise-1.8.6-20090610/bin/gem /usr/bin/gem link
copy_file /opt/ruby-enterprise-1.8.6-20090610/bin/s3cmd /usr/bin/s3cmd link
copy_file /opt/ruby-enterprise-1.8.6-20090610/bin/s3sync /usr/bin/s3sync link
