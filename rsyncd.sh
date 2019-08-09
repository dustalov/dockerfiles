#!/bin/sh -e

# This script is based on entrypoint.sh published at
# https://github.com/axiom-data-science/rsync-server

USERNAME=${USERNAME:-rsync}
PASSWORD=${PASSWORD:-rsync}

echo "$USERNAME:$PASSWORD" > /etc/rsyncd.secrets
chmod 0400 /etc/rsyncd.secrets

UID=${UID:-nobody}
GID=${GID:-nobody}

mkdir -p /data
chown -Rv $UID:$GID /data

cat <<EOF > /etc/rsyncd.conf
pid file = /var/run/rsyncd.pid
log file = /dev/stdout
timeout = 300
max connections = 10
port = 873

[data]
    uid = $UID
    gid = $GID
    read only = false
    path = /data
    comment = /data directory
    auth users = $USERNAME
    secrets file = /etc/rsyncd.secrets
EOF

exec /usr/bin/rsync --no-detach --daemon --config /etc/rsyncd.conf
