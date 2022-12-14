#!/bin/bash
# remember to create cache volume
if ! docker volume inspect satnogs-auto-scheduler-cache > /dev/null 2>&1 ; then
	echo "creating cache volume"
	docker volume create satnogs-auto-scheduler-cache
	docker run --rm -u 0:0 -v satnogs-auto-scheduler-cache:/tmp/cache/ -it knegge/satnogs-auto-scheduler:latest chown -R satnogs:satnogs /tmp/cache/
fi

#source satnogs-config
#docker run -d --name satnogs-auto-scheduler \
#    -e SATNOGS_STATION_ID="${SATNOGS_STATION_ID}" \
#    -e SATNOGS_SCHEDULE_EXTRA="${SATNOGS_SCHEDULE_EXTRA}" \
#    -e SATNOGS_API_TOKEN="${SATNOGS_API_TOKEN}" \
#    -e SATNOGS_DB_API_TOKEN="${SATNOGS_DB_API_TOKEN}" \
#    -v satnogs-auto-scheduler-cache:/tmp/cache/ \
#    knegge/satnogs-auto-scheduler:latest

docker run \
    --name satnogs-auto-scheduler \
    -v satnogs-auto-scheduler-cache:/tmp/cache/ \
    -v $(pwd)/satnogs-config:/.env \
    -d knegge/satnogs-auto-scheduler:latest

