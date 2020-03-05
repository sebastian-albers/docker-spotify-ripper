#!/bin/sh

set -u

if [ "${GROUP_ID:=0}" -ne "0" ] && [ "${USER_ID:=0}" -ne "0" ]; then
  USER=spotifyripper
  GROUP=spotifyripper
  addgroup --gid "${GROUP_ID}" "${GROUP}" > /dev/null
  adduser --system --shell /bin/false --gid "${GROUP_ID}" --uid "${USER_ID}" "${USER}" > /dev/null 2>&1
else
  USER=root
  GROUP=root
fi

chown -R "${USER}:${GROUP}" /home/spotifyripper

su "${USER}" -s /bin/sh -c '/usr/local/bin/spotify-ripper "${0}" "$@"' -- "$@"

