#!/bin/bash

# Terminate already running polybar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polyvar-msg cmd quit

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch polybar using default config location ~/.config/polybar/config.ini
polybar monitor-1 &
polybar monitor-2 &

echo "Polybar launched.."
