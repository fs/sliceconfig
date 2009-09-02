# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# link config
copy_file $sliceconfig/config/etc/my.cnf /etc/my.cnf link


# configure service
chkconfig mysqld on


# restart service
service mysqld start

# create mysql root 

# setup passwd
pass=`apg -n 1`
message="Password for root@mysql on ${HOSTNAME}: ${pass}"


echo $message|mail -s "New access for admin@${HOSTNAME}" `get_value 'CONFIG_ROOT_ADDRESS'`
echo
echo $message
echo

mysql -u root -e  "UPDATE mysql.user SET Password=PASSWORD('$pass') WHERE User='root'"
mysql -u root -e "flush privileges"

mysql_conf=/root/.my.cnf

cat  >$mysql_conf << _DATA
[client]
password=$pass
host=localhost
_DATA
chmod 0600 $mysql_conf
chown root $mysql_conf
