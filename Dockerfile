FROM arm32v7/ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONIOENCODING=UTF-8 

# Codecs: lame, flac, vorbis to support mp3, flac, ogg
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

# Set up local user to run as
RUN useradd -u 1000 -ms /bin/bash spotifyripper

USER spotifyripper
ENV HOME /home/spotifyripper
RUN mkdir /home/spotifyripper/music /home/spotifyripper/.spotify-ripper

WORKDIR /home/spotifyripper/music
VOLUME ["/home/spotifyripper/.spotify-ripper", "/home/spotifyripper/music"]

ENTRYPOINT ["/usr/local/bin/spotify-ripper"]
