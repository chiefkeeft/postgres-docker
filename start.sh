#!/bin/sh -x

sudo systemctl daemon-reload
sudo systemctl enable pgbouncer.service
sudo chown -R postgres:postgres /var/log/postgresql/
sudo service dbus start
sudo service cron restart 
chown -R postgres:postgres /var/log/postgresql/
chown -R postgres:postgres /var/run/pgbouncer/


