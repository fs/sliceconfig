# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# cleanup condig dir
rm -rf /etc/vsftpd/*


# copy config
copy_file $sliceconfig/config/etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf
copy_file $sliceconfig/config/etc/vsftpd/make_users_db.sh /etc/vsftpd/make_users_db.sh

copy_file $sliceconfig/config/etc/pam.d/vsftpd /etc/pam.d/vsftpd

copy_file $sliceconfig/config/etc/vsftpd/users.txt /etc/vsftpd/users.txt

# setup passwd
pass=`apg -n 1`
echo "admin ${pass}" > /etc/vsftpd/users.txt

message="Password for ftp admin@${HOSTNAME}: ${pass}"
echo $message|mail -s "New ftp access for admin@${HOSTNAME}" `get_value 'CONFIG_ROOT_ADDRESS'`
echo
echo $message
echo


# copy template
cp -R $sliceconfig/config/etc/vsftpd/users /etc/vsftpd/users


# create db
sh /etc/vsftpd/make_users_db.sh


# configure service
chkconfig vsftpd on


# restart service
service vsftpd start
