# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved

# Upload files to the new slice 

sliceconfig=`dirname $0`/..
sliceconfig=`readlink -f $sliceconfig`

archive=sliceconfig-`date +%F`.tar.bz2
slice=$1

# update 
git pull

# create archive 
cd $sliceconfig/../
tar -cjf $archive ./sliceconfig

# upload 
scp ./$archive $slice:~/

echo
echo "1. Login to the new slice"
echo "> ssh ${slice}"
echo
echo "2. Extract SliceConf archive to the /etc directory:"
echo "> tar -xjf ./${archive} -C /etc"
echo
echo "3. Install base stack:"
echo "> sh /etc/sliceconfig/install/install_base.sh"
echo
