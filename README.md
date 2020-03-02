# spotify-ripper containerized in Docker.

See <https://github.com/sebastian-albers/spotify-ripper>.

Example invocation in docker:

    docker run -ti --rm=true -u=1000 -v ~/.spotify-ripper:/home/spotifyripper/.spotify-ripper -v `pwd`:/home/spotifyripper/music sebastian-albers/spotify-ripper  "$@"
