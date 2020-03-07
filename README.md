# spotify-ripper containerized in Docker

![Travis](https://img.shields.io/travis/com/sebastian-albers/docker-spotify-ripper.svg)
![Docker Build Status](https://img.shields.io/docker/cloud/build/sebastianalbers/spotify-ripper.svg)
![Docker Automated build](https://img.shields.io/docker/cloud/automated/sebastianalbers/spotify-ripper.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/sebastianalbers/spotify-ripper.svg)
![Docker Stars](https://img.shields.io/docker/stars/sebastianalbers/spotify-ripper.svg)

*spotify-ripper running on Ubuntu 18.04 with Python 2.7*

Example invocation:

    docker run -it --rm=true \
        -e SPOTIPY_CLIENT_ID=0123456789abcdef0123456789abcdef \
        -e SPOTIPY_CLIENT_SECRET=fedcba9876543210fedcba9876543210 \
        -v ~/.spotify-ripper:/config \
        -v `pwd`:/music \
        sebastian-albers/spotify-ripper spotify:track:5s2eeHTMSBFRfgMW59t4ig

For details on how to use spotify-ripper see: <https://github.com/sebastian-albers/spotify-ripper>

## Mountpoints
|Mountpoint|Description|
|----------|-----------|
|`/config`|Configuration files. Put `config.ini` and `spotify_appkey.key` here.|
|`/music`|Songs downloaded from Spotify are placed here.|

## Mandatory environment variables
|Environment Variable|Description|
|--------------------|-----------|
|`SPOTIPY_CLIENT_ID`|Client id of Spotify application, details see: <https://github.com/sebastian-albers/spotify-ripper>|
|`SPOTIPY_CLIENT_SECRET`|Client secret of Spotify application, details see: <https://github.com/sebastian-albers/spotify-ripper>|

## Optional environment variables
|Environment Variable|Description|
|--------------------|-----------|
|`USER_ID`|Specifies the user id spotify-ripper should run as. All created files will be owned by this user id. Defaults to 1000.|
|`GROUP_ID`|Specifies the group id for all created files. This only works in combination with the `USER_ID`. Defaults to 1000.|

