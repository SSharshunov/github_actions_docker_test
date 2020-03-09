FROM debian:jessie

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y install \
    build-essential gawk libncurses-dev intltool python \
    git subversion time unzip zlib1g-dev libssl-dev wget curl cpio bc \
    gettext gettext-base liblocale-gettext-perl

WORKDIR /src/chaos_calmer
COPY ./ ./

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
