# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved

# include config
. `dirname $0`/configuration.sh

# setup passwd
pass=`apg -n 1`
message="Password for root@${HOSTNAME}: ${pass}"

echo $pass|passwd --stdin root 1>/dev/null
echo $message|mail -s "New access for root@${HOSTNAME}" `get_value 'CONFIG_ROOT_ADDRESS'`
echo
echo $message
echo


# generate keys
ssh-keygen -q -N '' -f /root/.ssh/id_rsa


# copy known hosts
copy_file $sliceconfig/config/root/.ssh/known_hosts /root/.ssh/known_hosts


# setup valid perms
chown -R root.root /root
chmod -R a-rwx /root
chmod -R u+rwX /root
