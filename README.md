# SatNOGS auto scheduler - docker build
Cloning and building are not needed if you just want to run it.<br>
You only need the config, up.sh and down.sh

## Building

Use `build.sh` to build the image locally.

## Installation

Edit the `satnogs-config` file and add at least the station ID and network API, the DB key is recommended as it speeds up the TLE pull.<br>
Or use the same config as satnogs-client and add `SATNOGS_SCHEDULE_EXTRA` and `SATNOGS_DB_API_TOKEN`.<br>
To get your DB API token, log in to [DB](https://db.satnogs.org/) and select settings/api token in the upper right.

Start it up with `up.sh` and remove it with `down.sh`
Optionally remove the cache volume, see `down.sh`

