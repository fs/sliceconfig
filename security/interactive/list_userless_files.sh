# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# find userless files
find / -path /proc -prune -o -nouser -o -nogroup
