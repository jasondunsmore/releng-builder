#!/bin/bash

# make sure we don't require tty for sudo operations
cat <<EOF >/etc/sudoers.d/89-jenkins-user-defaults
Defaults:jenkins !requiretty
jenkins     ALL = NOPASSWD: ALL
EOF

yum clean all
yum install -y -q python-netaddr

## Install docker-py
yum install -y -q python-docker-py

# make sure the firewall is stopped
service iptables stop

# vim: sw=2 ts=2 sts=2 et :
