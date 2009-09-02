# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# sliceconfig dir
sliceconfig=`dirname $0`/../..
sliceconfig=`readlink -f $sliceconfig`


for i in lp news uucp gopher games news
do
  if ( sh $sliceconfig/security/interactive/list_all_users.sh|grep ${i} >> /dev/null ); then
    userdel ${i}
  fi
done
