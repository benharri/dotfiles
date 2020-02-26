#!/usr/bin/env bash

DISTRO="$1"
RELEASE="$2"
PKGLIST="${DISTRO}.pkglist"

[ -z $DISTRO -o -z $RELEASE ] && \
    printf "usage: sudo %s <distro> <release>\n" "$0" && exit 1

[[ $(id -u) != 0 ]] && \
    printf "re-run this as root\n" && exit 1

# make sure we have sources
printf "deb https://mirror.bhh.sh/syncthing/ syncthing stable\n" \
    > /etc/apt/sources.list.d/syncthing.list
printf "deb https://mirror.bhh.sh/weechat/%s %s main \n" "${DISTRO}" "${RELEASE}" \
    > /etc/apt/sources.list.d/weechat.list

apt update
apt upgrade -y
apt full-upgrade -y

apt install -y $(xargs < ${PKGLIST})


printf "install makefiles? [y/n]"
read answer

[[ "$answer" = "y" ]] && \
    make nuke install

