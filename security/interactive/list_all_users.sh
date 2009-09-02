# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


egrep -v '.*:\.' /etc/shadow | awk -F: '{print $1}'
