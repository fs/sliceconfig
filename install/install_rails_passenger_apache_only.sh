# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved

# sliceconfig dir
sliceconfig=`dirname $0`/..
sliceconfig=`readlink -f $sliceconfig`


sh $sliceconfig/install/scripts/setup_httpd_passenger.sh 80

# install required software
sh $sliceconfig/install/scripts/install_httpd.sh
sh $sliceconfig/install/scripts/install_ruby_passenger.sh


# user configurations
sh $sliceconfig/install/scripts/setup_users_rails.sh

# software configuration
sh $sliceconfig/install/scripts/setup_httpd_passenger.sh
sh $sliceconfig/install/scripts/setup_munin_node_nginx.sh
sh $sliceconfig/install/scripts/setup_munin_node_httpd_passenger.sh
sh $sliceconfig/install/scripts/setup_monit_httpd_passenger.sh


# setup perm on several dirs
sh $sliceconfig/security/scripts/setup_perms_rails.sh
sh $sliceconfig/security/scripts/setup_perms_etc.sh


# erase history
sh $sliceconfig/security/scripts/erase_history.sh
