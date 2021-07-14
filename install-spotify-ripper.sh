#!/bin/bash

set -euo pipefail

# parameters
GITHUB_TOKEN=$1

ARCHIVE_URL="https://api.github.com/repos/sebastian-albers/spotify-ripper/tarball"

# add mopidy repository for libspotify
apt-get -qq update
apt-get -qq install -y curl wget apt-transport-https gnupg
curl -sL http://apt.mopidy.com/mopidy.gpg | apt-key add -
wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/stretch.list
apt-get -qq update

# install prerequisites and codecs: lame, flac, vorbis, fdkaac to support mp3, flac, ogg, aac
apt-get -qq install -y libspotify12 libspotify-dev python python-idna python-pkg-resources \
  libffi-dev python-pip python-dev lame flac vorbis-tools fdkaac

# install spotify-ripper from master branch
mkdir /usr/src/spotify-ripper
curl --header "authorization: Bearer ${GITHUB_TOKEN}" -sL "${ARCHIVE_URL}" | \
  tar xz -C /usr/src/spotify-ripper --strip-components=1
pip install --upgrade pip
cd /usr/src/spotify-ripper && pip install --upgrade .

# clean up
apt-get -qq --purge autoremove -y libffi-dev python-pip python-dev libspotify-dev \
  curl wget apt-transport-https gnupg
apt-get clean
rm -rf /var/lib/apt/lists/* /etc/apt/sources.list.d/mopidy.list
rm -rf /tmp/* /usr/src/spotify-ripper

