#!/bin/sh -x

apt-get -qq update
apt-get -y install git
apt-get -y install sudo
apt-get -y install build-essential libtool automake libevent-dev pkg-config libssl-dev 
cd /opt
git clone https://github.com/pgbouncer/pgbouncer.git
chown -R postgres:postgres pgbouncer/
chsh -s /bin/bash postgres
cd /opt/pgbouncer
git submodule init
git submodule update
./autogen.sh
./configure ...
make
sudo make install
sudo mkdir /etc/pgbouncer/
sudo chown -R postgres:postgres /etc/pgbouncer/
su postgres
cp /tmp/backup-manager.conf /etc/
cp /tmp/pgbouncer.ini /etc/pgbouncer/
cp /tmp/pgbouncer /etc/init.d/pgbouncer
cp /usr/local/share/doc/pgbouncer/userlist.txt /etc/pgbouncer/
ln -s /opt/pgbouncer/pgbouncer /usr/bin/pgbouncer
sudo chown -R postgres:postgres /var/log/postgresql/
sudo mkdir /var/run/pgbouncer/
sudo chown -R postgres:postgres /var/run/pgbouncer/
sudo chmod +x /etc/init.d/pgbouncer
sudo mkdir /var/log/postgresql
sudo chown -R postgres:postgres /var/log/postgresql/
sudo mkdir /var/run/pgbouncer/
chown -R postgres:postgres /var/run/pgbouncer/
apt-get -y install locales
#sudo locale-gen ru_RU.UTF-8
#sudo locale-gen ru_RU
#LC_ALL = ru_RU.UTF-8
#LANG = "ru_RU.utf8"
#sudo update-locale LC_ALL="ru_RU.UTF-8" LC_CTYPE="ru_RU.UTF-8"


