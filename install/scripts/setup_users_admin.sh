# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# add user
useradd -G wheel admin


# setup passwd
pass=`apg -n 1`
message="Password for admin@${HOSTNAME}: ${pass}"

echo $pass|passwd --stdin admin 1>/dev/null
echo $message|mail -s "New access for admin@${HOSTNAME}" `get_value 'CONFIG_ROOT_ADDRESS'`
echo
echo $message
echo


# add auth hosts
mkdir /home/admin/.ssh

copy_file $sliceconfig/config/home/admin/.ssh/authorized_keys /home/admin/.ssh/authorized_keys

# copy known hosts
copy_file $sliceconfig/config/home/admin/.ssh/known_hosts /home/admin/.ssh/known_hosts


# copy keys
copy_file $sliceconfig/config/home/admin/.ssh/id_rsa /home/admin/.ssh/id_rsa
copy_file $sliceconfig/config/home/admin/.ssh/id_rsa.pub /home/admin/.ssh/id_rsa.pub
copy_file $sliceconfig/config/home/admin/.bashrc /home/admin/.bashrc
copy_file $sliceconfig/config/home/admin/.bash_profile /home/admin/.bash_profile
copy_file $sliceconfig/config/home/admin/.tcshrc /home/admin/.tcshrc
copy_file $sliceconfig/config/home/admin/.tcsh_screenrc /home/admin/.tcsh_screenrc


# setup valid perms
chown -R admin.admin /home/admin
chmod -R a-rwx /home/admin
chmod -R u+rwX /home/admin
