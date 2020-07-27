FROM meitu/jdk:latest

LABEL maintainer "Ligboy.Liu <ligboy@gmail.com>"

ENV ANDROID_HOME /opt/android-sdk
ENV ANDROID_SDK_ROOT /opt/android-sdk

ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools
RUN mkdir -p /root/.android && touch /root/.android/repositories.cfg && mkdir -p ${ANDROID_SDK_ROOT}

RUN cd /opt \
  && wget -q https://dl.google.com/android/repository/commandlinetools-linux-6609375_latest.zip -O commandlinetools.zip \
  && unzip -qq commandlinetools.zip \
  && mv -f tools ${ANDROID_SDK_ROOT}/ \
  && rm -f commandlinetools.zip \
  && wget -q https://dl.google.com/android/repository/platform-tools_r30.0.3-linux.zip -O platform-tools.zip \
  && unzip -qq platform-tools.zip \
  && mv -f platform-tools ${ANDROID_SDK_ROOT}/ \
  && rm -f platform-tools.zip \
  && yes | sdkmanager --licenses \
  && sdkmanager "extras;m2repository;com;android;support;constraint;constraint-layout-solver;1.0.0" \
  && sdkmanager "extras;m2repository;com;android;support;constraint;constraint-layout-solver;1.0.1" \
  && sdkmanager "extras;m2repository;com;android;support;constraint;constraint-layout;1.0.0" \
  && sdkmanager "extras;m2repository;com;android;support;constraint;constraint-layout;1.0.1" \
  && sdkmanager "extras;android;m2repository" \
  && sdkmanager "extras;google;m2repository" \
  && sdkmanager "build-tools;21.1.2" \
  && sdkmanager "build-tools;22.0.1" \
  && sdkmanager "build-tools;23.0.1" \
  && sdkmanager "build-tools;23.0.2" \
  && sdkmanager "build-tools;23.0.3" \
  && sdkmanager "build-tools;24.0.1" \
  && sdkmanager "build-tools;24.0.2" \
  && sdkmanager "build-tools;24.0.3" \
  && sdkmanager "build-tools;24.0.0" \
  && sdkmanager "build-tools;25.0.0" \
  && sdkmanager "build-tools;25.0.1" \
  && sdkmanager "build-tools;25.0.2" \
  && sdkmanager "build-tools;25.0.3" \
  && sdkmanager "build-tools;26.0.0" \
  && sdkmanager "build-tools;26.0.1" \
  && sdkmanager "build-tools;26.0.2" \
  && sdkmanager "build-tools;26.0.3" \
  && sdkmanager "build-tools;27.0.0" \
  && sdkmanager "build-tools;27.0.1" \
  && sdkmanager "build-tools;27.0.2" \
  && sdkmanager "build-tools;27.0.3" \
  && sdkmanager "build-tools;28.0.0" \
  && sdkmanager "build-tools;28.0.1" \
  && sdkmanager "build-tools;28.0.2" \
  && sdkmanager "build-tools;28.0.3" \
  && sdkmanager "build-tools;29.0.0" \
  && sdkmanager "build-tools;29.0.1" \
  && sdkmanager "build-tools;29.0.2" \
  && sdkmanager "build-tools;29.0.3" \
  && sdkmanager "build-tools;30.0.0" \
  && sdkmanager "build-tools;30.0.1" \
  && sdkmanager "platforms;android-21" \
  && sdkmanager "platforms;android-22" \
  && sdkmanager "platforms;android-23" \
  && sdkmanager "platforms;android-24" \
  && sdkmanager "platforms;android-25" \
  && sdkmanager "platforms;android-26" \
  && sdkmanager "platforms;android-27" \
  && sdkmanager "platforms;android-28" \
  && sdkmanager "platforms;android-29" \
  && sdkmanager "sources;android-23" \
  && sdkmanager "sources;android-24" \
  && sdkmanager "sources;android-25" \
  && sdkmanager "sources;android-26" \
  && sdkmanager "sources;android-27" \
  && sdkmanager "sources;android-28" \
  && sdkmanager "sources;android-29" \
  && sdkmanager "cmdline-tools;latest" \
  && apt-get clean -y \
  && apt-get autoremove -y \
  && rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/*

# Go to workspace
RUN mkdir -p /var/workspace
WORKDIR /var/workspace
