#!/bin/bash

# http://www.synchrosinteractive.com/blog/1-software/47-mongodb-repair-on-ubuntu
if [ "`sudo status mongodb`" = 'mongodb stop/waiting' ]; then
  echo 'repairing..'
  sudo rm /var/lib/mongodb/mongod.lock
  sudo -u mongodb mongod -f /etc/mongodb.conf --repair
  sudo start mongodb
  echo 'trying to connect..'
  mongo test
else
  echo 'mongodb is running..'
fi
