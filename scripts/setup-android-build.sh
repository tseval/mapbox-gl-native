#!/usr/bin/env bash

sudo apt-get install openjdk-7-jre-headless
sudo apt-get install openjdk-7-jdk

export JAVA_HOME="/usr/lib/jvm/java-7-openjdk-amd64"

# aapt needs these
sudo apt-get install lib32stdc++6
sudo apt-get install lib32z1

sudo apt-get install expect

pushd $HOME

if [ ! -d .android-sdk ] ; then
    if [ ! -f android-sdk_r24.0.2-linux.tgz ] ; then
        curl --retry 3 -f -# -L http://dl.google.com/android/android-sdk_r24.0.2-linux.tgz -o android-sdk_r24.0.2-linux.tgz
    fi
    tar xzf android-sdk_r24.0.2-linux.tgz
    mv android-sdk-linux .android-sdk
fi

popd

./scripts/accept_licenses.sh "~/.android-sdk/tools/android update sdk --no-ui -a --filter build-tools-21.1.2,android-21" "android-sdk-license-5be876d5"
