#!/bin/sh

set -ex

echo HTTP_PROXY=$HTTP_PROXY

cat <<EOF >/root/vagrantbox-version
${VAGRANTBOX_URL}
${VAGRANTBOX_VERSION}
EOF

freebsd-update --not-running-from-cron fetch install || :

mkdir -p /usr/local/etc/pkg/repos
cat <<'EOF' >/usr/local/etc/pkg/repos/FreeBSD-latest.conf
FreeBSD-latest: {
  url: "pkg+http://pkg.FreeBSD.org/${ABI}/latest",
  mirror_type: "srv",
  signature_type: "fingerprints",
  fingerprints: "/usr/share/keys/pkg",
  enabled: yes
}
EOF

env ASSUME_ALWAYS_YES=YES pkg bootstrap
pkg update
pkg upgrade -y

sysrc sendmail=NONE
