#!/bin/sh -x

sudo systemctl daemon-reload
sudo systemctl enable pgbouncer.service
sudo service postgresql restart
sudo chown -R postgres:postgres /var/log/postgresql/

