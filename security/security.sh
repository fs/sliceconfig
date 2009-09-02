# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# sliceconfig dir
sliceconfig=`dirname $0`/..
sliceconfig=`readlink -f $sliceconfig`


# upgrade system
sh $sliceconfig/security/scripts/update_yum.sh
sh $sliceconfig/security/scripts/update_rkhunter_db.sh 


# setup valid perms on sliceconfigs
sh $sliceconfig/security/scripts/setup_perms_sliceconfig.sh 


# erase unused users
sh $sliceconfig/security/scripts/erase_users.sh


# overwrite users bashrc
sh $sliceconfig/security/scripts/setup_users_bashrc.sh


# setup perm on several dirs
sh $sliceconfig/security/scripts/setup_perms_root.sh
sh $sliceconfig/security/scripts/setup_perms_home.sh
sh $sliceconfig/security/scripts/setup_perms_etc.sh
sh $sliceconfig/security/scripts/setup_perms_logs.sh
sh $sliceconfig/security/scripts/setup_perms_tools.sh
sh $sliceconfig/security/scripts/setup_perms_suid.sh


# erase history
sh $sliceconfig/install/scripts/erase_history.sh