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
    if [ -n "${SATNOGS_SCHEDULE_STATIONS}" ]; then
        echo "Running multi station.."
        for STATION in ${SATNOGS_SCHEDULE_STATIONS}; do
            echo "Station ${STATION}"
            schedule_single_station.py -s ${STATION} ${SATNOGS_SCHEDULE_EXTRA}
        done
    elif [ -n "${SATNOGS_STATION_ID}" ]; then
        echo "Running single station ${SATNOGS_STATION_ID}"
        schedule_single_station.py -s ${SATNOGS_STATION_ID} ${SATNOGS_SCHEDULE_EXTRA}
    else
        echo "No station specified"
        exit 1
    fi
    sleep 3600
done

