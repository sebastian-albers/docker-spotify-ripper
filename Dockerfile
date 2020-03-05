FROM arm32v7/ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONIOENCODING=UTF-8

# codecs: lame, flac, vorbis, fdkaac to support mp3, flac, ogg, aac
RUN apt-get -qq update && \
    apt-get -qq install -y curl apt-transport-https wget && \
    curl -sL http://apt.mopidy.com/mopidy.gpg | apt-key add - && \
    wget -q -O /etc/apt/sources.list.d/mopidy.list https://apt.mopidy.com/stretch.list && \
    apt-get -qq update && \
    apt-get -qq install -y libspotify12 libspotify-dev python3 python3-pkg-resources libffi-dev python3-pip python3-dev lame flac vorbis-tools fdkaac && \
    mkdir /usr/src/spotify-ripper && \
    curl -sL https://api.github.com/repos/sebastian-albers/spotify-ripper/tarball | tar xz -C /usr/src/spotify-ripper --strip-components=1 && \
    pip3 install --upgrade pip && \
    cd /usr/src/spotify-ripper && pip3 install --upgrade . && \
    apt-get -qq --purge autoremove -y libffi-dev python3-pip python3-dev libspotify-dev curl apt-transport-https apt-transport-https wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /etc/apt/sources.list.d/mopidy.list && \
    rm -rf /tmp/* /usr/src/spotify-ripper

RUN mkdir -p /home/spotifyripper/.spotify-ripper /home/spotifyripper/music
VOLUME ["/home/spotifyripper/.spotify-ripper", "/home/spotifyripper/music"]

WORKDIR /home/spotifyripper/music

COPY start.sh /usr/bin/start-spotify-ripper
ENTRYPOINT ["/usr/bin/start-spotify-ripper"]

