#!/bin/bash

set -eou pipefail

docker run sebastianalbers/spotify-ripper:latest-$1 --version 2>&1

