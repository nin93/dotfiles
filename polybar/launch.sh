# !/usr/bin/env bash

# Terminate already running bar instances
pkill polybar
# Window Manager workspaces
polybar workspaces > /tmp/workspaces.log 2>&1 &
# MPD controller
polybar music-player > /tmp/music-player.log 2>&1 &
# Date & Time
polybar time > /tmp/time.log 2>&1 &
# Xwindow title
polybar app-title > /tmp/app-title.log 2>&1 &
# Sound, Network interfaces
polybar client-monitor > /tmp/client-monitor.log 2>&1 &
# Mem & CPU traking
polybar sys-monitor > /tmp/sys-monitor.log 2>&1 &

echo "Bars launched"
