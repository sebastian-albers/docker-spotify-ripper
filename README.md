# spotify-ripper containerized in Docker.

See <https://github.com/sebastian-albers/spotify-ripper>.

Example invocation in docker:

    docker run -ti --rm=true -u=1000 -v ~/.spotify-ripper:/home/spotifyripper/.spotify-ripper -v `pwd`:/home/spotifyripper/music sebastian-albers/spotify-ripper "$@"

## Mandatory environment variables
|Environment Variable|Description|
|--------------------|-----------|
|SPOTIPY_CLIENT_ID|Client id of Spotify application.|
|SPOTIPY_CLIENT_SECRET|Client secret of Spotify application.|


## Optional environment variables
|Environment Variable|Description|
|--------------------|-----------|
|USER_ID|Specifies the user id the daemon should run as. All created files will be owned by this user id. Defaults to 1000.|
|GROUP_ID|Specifies the group id for all created files. This only works in combination with the USER_ID. Defaults to 1000.|

