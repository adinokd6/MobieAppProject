#!/bin/bash

echo "If everythig worked well you should see that you're successfully authenticated."

ssh -T git@github.com


echo "Now programm will install rails packages"

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt update
sudo apt-get install -y nodejs yarn


gem install rails -v 7.0.2.3

rbenv rehash


echo "If above steps worked welle you shuould see something similiar to #Rails 7.0.2.3"

rails -v

echo "We will use postgreSQL so the next step is to install it on our machine."


sudo apt-get install wget ca-certificates
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
sudo apt-get update
sudo apt install postgresql-contrib libpq-dev

sudo -u postgres createuser appadmin -s

sudo -u postgres psql


echo "DONE!"