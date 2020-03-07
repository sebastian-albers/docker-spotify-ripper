#!/bin/sh

set -u

USER_ID="${USER_ID:-1000}"
GROUP_ID="${GROUP_ID:-1000}"

USER=spot
GROUP=spot

# add user and group
addgroup --gid "${GROUP_ID}" "${GROUP}" > /dev/null
adduser --system --shell /bin/false --gid "${GROUP_ID}" --uid "${USER_ID}" "${USER}" > /dev/null
ln -s /config "/home/${USER}/.spotify-ripper"

chown -R "${USER}:${GROUP}" /music

su "${USER}" -s /bin/sh -c 'PYTHONIOENCODING=UTF-8 /usr/local/bin/spotify-ripper "${0}" "$@"' -- "$@"

