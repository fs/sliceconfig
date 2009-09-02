# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# sliceconfig dir
sliceconfig=`dirname $0`/../..
sliceconfig=`readlink -f $sliceconfig`

# check params
if [ $# -ne 3 ];then  
  echo
  echo "use: $0 user db pass"
  echo  
  exit
fi

user=$1
db=$2
pass=$3

echo "grant access to $db for $user"
mysql -u root  -e "grant all privileges on $db.* to '$user'@'%' identified by '$pass'"
mysql -u root  -e "flush privileges"
