#!/bin/sh -x

sudo systemctl daemon-reload
sudo systemctl enable pgbouncer.service
