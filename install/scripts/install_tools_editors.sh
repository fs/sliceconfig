# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


yum -y -d1 install mc.x86_64 vim-enhanced.x86_64
yum -y -d1 localinstall --nogpgcheck $sliceconfig/install/files/bash-completion-20060301-4.el5.noarch.rpm
