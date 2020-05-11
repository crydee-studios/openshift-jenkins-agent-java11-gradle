# openshift-jenkins-agent-java11-gradle

Java 11 slave image with sensible default Gradle options for Jenkins on Openshift 3.11

Based on [Openshift 3.11 slave base](https://github.com/openshift/jenkins/tree/openshift-3.11/slave-base) with the following changes:

* Java 11
* Gradle default options

The docker image is available on [Dockerhub](https://hub.docker.com/repository/docker/crydeestudios/openshift-jenkins-agent-java11-gradle)

`crydeestudios/openshift-jenkins-agent-java11-gradle`

## Build

`build -t openshift-jenkins-agent-java11-gradle .`

## Motivation

The [Openshift 3.11 slave base](https://github.com/openshift/jenkins/tree/openshift-3.11/slave-base) does not support Java 11 (only Java 8) and there don't appear to be any OpenShift 3.11 compatible slave images for Java 11 within the [Openshift 3.11 Jenkins Repository](https://github.com/openshift/jenkins/tree/openshift-3.11). I also needed an image with sensible default Gradle options for executing Gradle builds within a container.

## Notes

1) The default JNLP max memory allocation is set to 10%.

2) Java 11 is installed _in addition_ to the existing Java 8 installation on the base image.

3) Gradle version config defaults to the image version. i.e. `openshift-jenkins-agent-java11-gradle:5.4` will default to Gradle 5.4

4) `GRADLE_OPTS` applies [Openshift recommended Gradle settings](https://docs.openshift.com/container-platform/3.11/using_images/other_images/jenkins_slaves.html#gradle-builds) for building within a container.

5) `contrib/bin/configure-agent` is used to override default slave base settings. 
    
    Java is set to the Java-11 alternative.
        
    `JAVA_TOOL_OPTIONS` is set to `" "` to stop the base image from applying Java 11 incompatible options

## Environment Variables

* All original base image environment variables may be applied.
* `CONTAINER_HEAP_PERCENT`: Percentage of the container allocated memory to apply to the JNLP agent process.
* `GRADLE_OPTS`: Override the default.

## Samples

`sample/configmap.yaml`

`sample/buildconfig.yaml`
