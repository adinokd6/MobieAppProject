#!/bin/bash

echo "Type your github name: "
read gitname
echo "Type your github email: "
read gitmail

git config --global color.ui true
git config --global user.name $gitname
git config --global user.email $gitmail

ssh-keygen -t rsa -b 4096 -C $gitmail

echo "Copy this under certifiacate to your github accout ssh-keys. Link to proper site will open in about 30sec."

cat ~/.ssh/id_rsa.pub

sleep 15
echo "Now you will have 60sec to login to your github account and add ssh key"

xdg-open https://github.com/settings/ssh