# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh

yum -y -d1 localinstall --nogpgcheck $sliceconfig/install/files/perl-Error-0.17010-1.el5.noarch.rpm $sliceconfig/install/files/perl-Git-1.5.5.1-2.el5.x86_64.rpm $sliceconfig/install/files/git-1.5.5.1-2.el5.x86_64.rpm
