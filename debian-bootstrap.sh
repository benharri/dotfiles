#!/bin/sh

echo "deb http://repo.vivaldi.com/stable/deb/ stable main" > /etc/apt/sources.list.d/vivaldi.list
echo "deb [arch=amd64] http://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list

apt update
apt upgrade -y
apt full-upgrade -y

apt install -y $(xargs < packages.txt)
