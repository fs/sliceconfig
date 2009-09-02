# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# create ssl certs
ssl_dir=/etc/nginx/ssl

# prepare for makeing root CA
[ -d $ssl_dir ]&&mv $ssl_dir $ssl_dir.orig

mkdir -p  $ssl_dir/db/{newcerts,certs}
touch $ssl_dir/db/index.txt
echo "01" > $ssl_dir/db/serial

# ssl.conf
cat >$ssl_dir/ca.config <<_DATA
[ ca ]
default_ca = CA_CLIENT

[ CA_CLIENT ]
dir = ./db
certs = \$dir/certs
new_certs_dir = \$dir/newcerts
database = \$dir/index.txt

serial = \$dir/serial
certificate = ./ca.crt
private_key = ./ca.key
default_days = 5000

default_md = md5
policy     = policy_any

[ policy_any ]

countryName = optional
stateOrProvinceName = optional
localityName = optional
organizationName = optional
organizationalUnitName = optional
commonName = supplied
emailAddress = optional

_DATA

cd $ssl_dir

# create root CA
openssl req -new -newkey rsa:1024 -nodes -keyout $ssl_dir/ca.key -x509 -days 5000 -subj /C=RU/ST=Msk/L=Msk/O=Flatsourcing/OU=FS/CN=flatsourcing.com/emailAddress=support@flatsourcing.com  -out $ssl_dir/ca.crt

# create client cert
openssl req -new -newkey rsa:1024 -nodes -keyout $ssl_dir/ssl_cert.key -subj /C=RU/ST=Msk/L=Msk/O=Flatsourcing/OU=FS/CN=`hostname`/emailAddress=support@flatsourcing.com  -out $ssl_dir/ssl_cert.csr

# sign it!
openssl ca -config $ssl_dir/ca.config -in $ssl_dir/ssl_cert.csr -out $ssl_dir/ssl_cert.crt -batch

