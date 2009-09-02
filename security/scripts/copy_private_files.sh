# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
sliceconfig=`dirname $0`/../..
sliceconfig=`readlink -f $sliceconfig`
. "$sliceconfig/install/scripts/configuration.sh"

path=`get_value CONFIG_PRIVATE`
# copy, extract and remove archive with private files
scp $path $sliceconfig/
echo "Extracting private files"
tar xjf $sliceconfig/`basename $path` -C $sliceconfig/config/
rm -f $sliceconfig/`basename $path`