#!/bin/bash -x
export DEBIAN_FRONTEND=noninteractive
cd /home/vagrant
echo Who am I? You are `whoami`.
echo Where am I? You are in `pwd`
echo I think my home is $HOME
echo export EDITOR=vim >> $HOME/.bashrc
# Enable accessing Postgres from the host machin
echo "listen_addresses = '*'" | tee -a /var/pgsql/data/postgresql.conf
echo host all all  0.0.0.0/0 trust | tee -a  /var/pgsql/data/pg_hba.conf
sudo su postgres -c 'pg_ctl restart -D /var/pgsql/data  2>&1 &'
su -c "source /home/vagrant/web/vagrant/user-config.sh" vagrant
