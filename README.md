# SatNOGS auto scheduler - docker build

## Building

Use `build.sh` to download required images and build the container.
It will be available on dockerhub in the future.

## Installation

Edit the `.env` file and add at least the station ID and network API, the DB key is recommended as it speeds up the TLE pull.

Use `run.sh` to verify that it is working properly, it removes the container after it exits.
Then add it to docker with `up.sh` and remove it with `down.sh`
Optionally remove the cache volume, see `down.sh`

