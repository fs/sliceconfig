# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# sliceconfig dir
sliceconfig=`dirname $0`/../..
sliceconfig=`readlink -f $sliceconfig`


# fstab perms
chown root:root /etc/fstab
chmod 0644 /etc/fstab


# auth files
chown root:root /etc/passwd
chmod 0644 /etc/passwd

chown root:root /etc/group
chmod 0644 /etc/group

chown root:root /etc/shadow
chmod 0400 /etc/shadow


# cron files
chown -R root:root /etc/cron.{d,daily,hourly,monthly,weekly}
chmod -R 700 /etc/cron.{d,daily,hourly,monthly,weekly}

chmod -R 700 $sliceconfig/config/etc/cron.{daily,hourly}

chown -R root:root /etc/crontab
chmod -R 0600 /etc/crontab

chmod -R 0600 $sliceconfig/config/etc/crontab


# yum files
chown -R root:root /etc/yum*
chmod -R 0600 /etc/yum.conf
chmod -R o-rwx,u+rwX /etc/yum.repos.d /etc/yum

chmod -R 0600 $sliceconfig/config/etc/yum.conf
chmod -R o-rwx,u+rwX $sliceconfig/config/etc/yum.repos.d $sliceconfig/config/etc/yum


# monit files
chown -R root:root /etc/monit*
chmod -R 0600 /etc/monit.conf
chmod -R o-rwx,u+rwX /etc/monit.d

chmod -R o-rwx,u+rwX $sliceconfig/config/etc/monit.d


# init.d files
chown -R root:root /etc/init.d
chmod -R 0754 /etc/init.d

chown -R root:root /etc/rc*.d
chmod -R 0754 /etc/rc*.d


# welcome banner
chown -R root:root /etc/motd
chmod -R 0644 /etc/motd

chmod -R 0644 $sliceconfig/config/etc/motd


# hosts files
chown -R root:root /etc/hosts.allow
chmod -R 0640 /etc/hosts.allow

chmod -R 0640 $sliceconfig/config/etc/hosts.allow

chown -R root:root /etc/hosts.deny
chmod -R 0640 /etc/hosts.deny

chmod -R 0640 $sliceconfig/config/etc/hosts.deny


# ssh files
chown -R root:root /etc/ssh
chmod -R 0600 /etc/ssh


# aliases files
chown -R root:root /etc/aliases
chmod -R 0644 /etc/aliases

chmod -R 0644 $sliceconfig/config/etc/aliases


# sudoers
chown root:root /etc/sudoers
chmod 0440 /etc/sudoers


# i18n
chown root:root /etc/sysconfig/i18n $sliceconfig/config/etc/sysconfig/i18n
chmod 0644 /etc/sysconfig/i18n $sliceconfig/config/etc/sysconfig/i18n


# s3sync
chown -R root:root /etc/s3conf
chmod -R a-rwx,u+rwX /etc/s3conf $sliceconfig/config/etc/s3conf


# vsftpd
chown -R root:root /etc/vsftpd
chmod -R a-rwx,u+rwX /etc/vsftpd $sliceconfig/config/etc/vsftpd