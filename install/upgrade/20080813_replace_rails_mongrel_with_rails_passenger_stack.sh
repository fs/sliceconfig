# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# sliceconfig dir
sliceconfig=`dirname $0`/../..
sliceconfig=`readlink -f $sliceconfig`


# install httpd & passenger
sh $sliceconfig/install/scripts/install_httpd.sh
sh $sliceconfig/install/scripts/install_ruby_passenger.sh


# software configuration
sh $sliceconfig/install/scripts/setup_httpd_passenger.sh
sh $sliceconfig/install/scripts/setup_monit_httpd_passenger.sh
sh $sliceconfig/install/scripts/setup_monit_nginx.sh


# setup perm on several dirs
sh $sliceconfig/security/scripts/setup_perms_nginx.sh
sh $sliceconfig/security/scripts/setup_perms_rails.sh
sh $sliceconfig/security/scripts/setup_perms_etc.sh