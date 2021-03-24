#!/bin/sh

# check if telegraf is running
if ! pgrep -x "telegraf" > /dev/null
then
    exit 1
fi

# check if mariadb is running
if ! pgrep "mariadb" > /dev/null
then
    exit 1
fi
