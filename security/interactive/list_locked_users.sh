# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# list all locked users
egrep '.*:\*|:!' /etc/shadow | awk -F: '{print $1}'
