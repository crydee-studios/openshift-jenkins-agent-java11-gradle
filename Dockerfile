FROM openshift/jenkins-slave-base-centos7:v3.11

LABEL maintainer="dean@crydeestudios.com"

ENV JAVA_VERSION=java-11 \
    CONTAINER_HEAP_PERCENT=0.1

RUN INSTALL_PKGS="$JAVA_VERSION-openjdk-devel.x86_64 $JAVA_VERSION-openjdk-devel.i686" && \
    yum install -y --setopt=tsflags=nodocs $INSTALL_PKGS && \
    rpm -V $INSTALL_PKGS 

ENV GRADLE_OPTS="-Dorg.gradle.daemon=false -Dorg.gradle.parallel=false -Dorg.gradle.workers.max=1" \
    GRADLE_USER_HOME=/home/jenkins/.gradle

RUN mkdir /home/jenkins/.gradle && \
    chmod 775 /home/jenkins/.gradle

ADD contrib/bin/configure-agent /usr/local/bin

