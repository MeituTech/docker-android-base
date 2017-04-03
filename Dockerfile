FROM meitu/android-base:latest
LABEL maintainer "Ligboy.Liu <ligboy@gmail.com>"

# ------------------------------------------------------
# --- Android Debug Keystore
#RUN mkdir -p /root/.android
#COPY ./android/debug.keystore /root/.android/debug.keystore

# Dependencies to execute Android builds
RUN dpkg --add-architecture i386
RUN apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get update -qq && apt-get install -y --no-install-recommends \
    libc6:i386 \
    libgcc1:i386 \
    libncurses5:i386 \
    libstdc++6:i386 \
    libz1:i386 \
    && apt-get clean -y && apt-get autoremove -y && rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/*

## Open JDK
#RUN DEBIAN_FRONTEND=noninteractive apt-get update -qq && apt-get install -y openjdk-8-jdk
## Oracle JDK
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | /usr/bin/debconf-set-selections
RUN add-apt-repository -y ppa:webupd8team/java && apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get update -qq && apt-get install -y --no-install-recommends \
    oracle-java8-installer \
    oracle-java8-set-default \
    && apt-get clean -y && apt-get autoremove -y && rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/*

# Install Git-lfs
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash \
    &&DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install git-lfs \
    && git lfs install

# Cleanup
RUN apt-get clean -y && apt-get autoremove -y && rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/*

# Go to workspace
RUN mkdir -p /var/workspace
WORKDIR /var/workspace