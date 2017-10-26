#!/bin/bash

# start redis in the background
echo "Starting redis"
redis-server &
echo "Redis in background"

# start the guestbook
cd /dist
echo "Starting guestbook"
./example-webapp-linux
status=$?
echo "Guestbook in background"
if [ $status -ne 0 ]; then
  echo "Failed to start guestbook: $status"
  exit $status
fi

# loop to keep check on redis
while /bin/true; do
  ps aux |grep example-webapp-linux |grep -q -v grep
  GUESTBOOK_STATUS=$?
  # If the greps above find anything, they will exit with 0 status
  # If they are not both 0, then something is wrong
  if [ $GUESTBOOK_STATUS -ne 0 ]; then
    echo "Guestbook exited."
    exit -1
  fi
  sleep 60
done
