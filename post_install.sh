#!/bin/sh
set -e

mkdir -p /usr/local/channels-dvr
cd /usr/local/
curl -f -s https://getchannels.com/dvr/setup.sh | env DOWNLOAD_ONLY=1 sh

pw user add dvr -c dvr -u 820 -d /nonexistent -s /usr/bin/nologin
chown -R dvr:dvr channels-dvr
sysrc channels_dvr_user=dvr

mkdir -p /usr/local/etc/rc.d
curl -f -s https://getchannels.com/dvr/install-freebsd.sh -o channels-dvr/install.sh
chmod +x channels-dvr/install.sh
sh channels-dvr/install.sh
