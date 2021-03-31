#!/bin/sh

# check if telegraf is running
if ! pgrep -x "telegraf" > /dev/null
then
    exit 1
fi

# check if grafana is running
if ! pgrep "grafana-server" > /dev/null
then
    exit 1
fi
