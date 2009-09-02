# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# Do not forget to add this files to the rkhunter whitelist

for i in /bin/mount /bin/umount /bin/ping /bin/traceroute /bin/ping6 /usr/sbin/arping /usr/bin/wall /usr/sbin/usernetctl
do
  if [ -e ${i} ]; then
    chmod a-s ${i}
  fi
done
