# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved

# sliceconfig dir
sliceconfig=`dirname $0`/..
sliceconfig=`readlink -f $sliceconfig`


# install required software
sh $sliceconfig/install/scripts/install_httpd.sh
sh $sliceconfig/install/scripts/install_php.sh


# software configuration
sh $sliceconfig/install/scripts/setup_httpd.sh
sh $sliceconfig/install/scripts/setup_php.sh
sh $sliceconfig/install/scripts/setup_munin_node_httpd.sh
sh $sliceconfig/install/scripts/setup_monit_httpd.sh


# setup perm on several dirs
sh $sliceconfig/security/scripts/setup_perms_php.sh
sh $sliceconfig/security/scripts/setup_perms_httpd.sh
sh $sliceconfig/security/scripts/setup_perms_etc.sh


# erase history
sh $sliceconfig/security/scripts/erase_history.sh
