#!/bin/bash
set -a

function terminate(){
    for child in $(pgrep -P $$); do
        kill "$child" 2>/dev/null
    done
}

if [ -n "$1" ]; then
	exec "$@"
fi

if [ -f "/.env" ]; then
    source /.env
fi

trap terminate SIGTERM

while true; do
    schedule_single_station.py -s ${SATNOGS_STATION_ID} ${SATNOGS_SCHEDULE_EXTRA}
    sleep 3600
done

