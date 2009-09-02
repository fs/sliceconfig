# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# link config
svnserve_conf=svnserve.conf
copy_file $sliceconfig/config/etc/monit.d/$svnserve_conf /etc/monit.d/$svnserve_conf link


# reload monit
monit reload

