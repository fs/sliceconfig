# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved

# list all unlocked users
# this should be the same as the
# known human user list

# list unlocked users
# should be all known users
egrep -v '.*:\*|:!' /etc/shadow | awk -F: '{print $1}'
