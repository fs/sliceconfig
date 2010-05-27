# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# create home dir and user
useradd -m -d /var/lib/subversion -r -s /sbin/nologin svn

# copy config
copy_file $sliceconfig/config/etc/init.d/svnserve /etc/init.d/svnserve
copy_file $sliceconfig/config/etc/sysconfig/subversion /etc/sysconfig/subversion


# iptables restart
/etc/init.d/iptables  restart
/etc/init.d/svnserve start
