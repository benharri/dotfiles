#!/bin/sh

apt update
apt upgrade -y
apt full-upgrade -y

apt install -y $(xargs < packages.txt)
