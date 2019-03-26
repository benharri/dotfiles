#!/usr/bin/env bash

DISTRO="$1"
RELEASE="$2"
PKGLIST="${DISTRO}.pkglist"

[ -z $DISTRO -o -z $RELEASE ] && \
    echo "usage: sudo $0 <distro> <release>" && exit 1

[[ $(id -u) != 0 ]] && \
    echo "re-run this as root" && exit 1

# make sure we have sources
echo "deb https://apt.syncthing.net/ syncthing stable" > /etc/apt/sources.list.d/syncthing.list
echo "deb https://weechat.org/${DISTRO} ${RELEASE} main" > /etc/apt/sources.list.d/weechat.list

apt update
apt upgrade -y
apt full-upgrade -y

apt install -y $(xargs < ${PKGLIST})


echo -n "install makefiles? [y/n]"
read answer

[[ "$answer" = "y" ]] && \
    make nuke install

