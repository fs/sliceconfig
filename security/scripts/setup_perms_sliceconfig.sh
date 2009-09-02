# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# sliceconfig dir
sliceconfig=`dirname $0`/../..
sliceconfig=`readlink -f $sliceconfig`


# lock down our own directory
chown -R root:root $sliceconfig/*
chmod -R o-rwx,u+rwX,ag+rX $sliceconfig