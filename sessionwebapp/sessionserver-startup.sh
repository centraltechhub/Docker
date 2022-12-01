#!/bin/sh
/home/admin/App/wlp/bin/server start sessionserver
tail -f /home/admin/App/wlp/usr/servers/sessionserver/logs/messages.log