# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# copy config
copy_file $sliceconfig/config/etc/monit.d/httpd_passenger.conf /etc/monit.d/httpd_passenger.conf

# reload monit
monit reload
