# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# list setuid files
find / -path /proc -prune -o -type f -perm +6000 -ls
