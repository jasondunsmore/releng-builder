#!/bin/bash

# make sure we don't require tty for sudo operations
cat <<EOF >/etc/sudoers.d/89-jenkins-user-defaults
Defaults:jenkins !requiretty
jenkins     ALL = NOPASSWD: /usr/bin/sshuttle, /usr/bin/kill, /usr/sbin/iptables
EOF

yum clean all
yum install -y -q unzip python-netaddr sshuttle @development
yum remove -y robotframework-{sshlibrary,requests}

# These development packages are needed for successful installation of robotframework-sshlibrary (done elsewhere)
yum install -y -q libffi-devel openssl-devel

## Install netcat & docker-py
yum install -y -q nc python-docker-py

# Install dependencies for matplotlib library used in longevity framework
yum install -y yum-utils
yum-builddep -y python-matplotlib

# make sure the firewall is stopped
service iptables stop

# install crudini command line tool for editing config files
yum install -y crudini

# vim: sw=2 ts=2 sts=2 et :
