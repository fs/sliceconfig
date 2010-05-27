# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# copy config
svnserve_conf=svnserve.conf
copy_file $sliceconfig/config/etc/monit.d/$svnserve_conf /etc/monit.d/$svnserve_conf


# reload monit
monit reload

