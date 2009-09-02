# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved

# sliceconfig dir
sliceconfig=`dirname $0`/..
sliceconfig=`readlink -f $sliceconfig`


# install required software
sh $sliceconfig/install/scripts/install_mysqld.sh
sh $sliceconfig/install/scripts/install_ruby_mysql.sh


# setup mysql
sh $sliceconfig/install/scripts/setup_mysqld.sh
sh $sliceconfig/install/scripts/setup_automysqlbackup.sh
sh $sliceconfig/install/scripts/setup_munin_node_mysqld.sh
sh $sliceconfig/install/scripts/setup_monit_mysqld.sh

# setup perm on several dirs
sh $sliceconfig/security/scripts/setup_perms_etc.sh
sh $sliceconfig/security/scripts/setup_perms_backups.sh


# erase history
sh $sliceconfig/security/scripts/erase_history.sh
