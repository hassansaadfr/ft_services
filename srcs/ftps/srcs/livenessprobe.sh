#!/bin/sh

# check if telegraf is running
if ! pgrep -x "telegraf" > /dev/null
then
    exit 1
fi

# check if vsftpd is running
if ! pgrep "vsftpd" > /dev/null
then
    exit 1
fi
