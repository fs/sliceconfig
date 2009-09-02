# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# sliceconfig dir
sliceconfig=`dirname $0`/../..
sliceconfig=`readlink -f $sliceconfig`


for user in $( sh $sliceconfig/security/interactive/list_unlocked_users.sh ); do
  if [ ${user} == "root" ]; then
    HOMEDIR="/root"
  else
    HOMEDIR="/home/${user}"
  fi

  if [ -e "${HOMEDIR}/.bashrc" ]; then
    mv ${HOMEDIR}/.bashrc ${HOMEDIR}/.bashrc.orig
  fi

  cat $sliceconfig/config/home/admin/.bashrc > ${HOMEDIR}/.bashrc
  chown -R ${user} ${HOMEDIR}/
done
