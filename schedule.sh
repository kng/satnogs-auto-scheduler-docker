#!/bin/bash
set -a
while true; do
	/satnogs-auto-scheduler/schedule_single_station.py -s ${SATNOGS_STATION_ID} ${SATNOGS_SCHEDULE_EXTRA}
	sleep 3600
done

