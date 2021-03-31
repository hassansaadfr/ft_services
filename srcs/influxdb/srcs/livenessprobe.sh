#!/bin/sh

# check if telegraf is running
if ! pgrep -x "telegraf" > /dev/null
then
    exit 1
fi

# check if influxd is running
if ! pgrep "influxd" > /dev/null
then
    exit 1
fi
