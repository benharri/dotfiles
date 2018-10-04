#!/bin/sh

apt update
apt upgrade -y
apt full-upgrade -y

while read pkg; do
    echo $pkg
    apt install $pkg
done < packages.txt

