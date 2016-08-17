Gitlab + Jenkins + Android -  Management Guild
==============================================

Install Gitlab
--------------

please refer:
- https://about.gitlab.com/downloads/#ubuntu1404



Install Jenkin Server
-------------------------

**install jenkins:**
- https://wiki.jenkins-ci.org/display/JENKINS/Installing+Jenkins+on+Ubuntu

apt-get install git


**install plugins:**

- Git Client plugin
- Git Parameter Plug-in
- Git plugin
- embeddable-build-status


Set up Jenkin Slave Nodes for android testing
---------------------------------------------------

### Install git & java sdk

**Install Java JRE & Oracle JDK:**

refer: https://www.digitalocean.com/community/tutorials/how-to-install-java-on-ubuntu-with-apt-get

```
sudo apt-get install python-software-properties
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update

sudo apt-get install oracle-java8-installer oracle-java8-set-default
```

**Install git:**

    $ sudo apt-get install git


### Install android sdk

```
$ wget http://dl.google.com/android/android-sdk_r24.3.4-linux.tgz

$ tar zxvf android-sdk_r24.3.4-linux.tgz
```

install *SDK Build-tools* and *SDK Platform* by android command

```
$ cd android-sdk-linux/tools
$ sudo ./android list sdk --all
$ sudo ./android update sdk -u -a -t <package no.>
```

If you working on UBUNTU 64 Bit: You have to install these packages to solve errors because Android SDK  did not fully support 64 Bit system.

    $ sudo apt-get install lib32stdc++6 lib32z1


Declare the sdk path:

created a file called local.properties and put inside

    sdk.dir=/path_to/android-sdk-linux

Or

    export ANDROID_HOME=/path_to/android-sdk-linux

### Install gradle

refer: http://linuxg.net/how-to-install-gradle-2-1-on-ubuntu-14-10-ubuntu-14-04-ubuntu-12-04-and-derivatives/

```
sudo add-apt-repository ppa:cwchien/gradle
sudo apt-get update
sudo apt-get install gradle
```

<br>
**Gradle Usage:**
- [Gradle User Guide](https://docs.gradle.org/current/userguide/userguide.html)
- **build apk:** gradle assemble

### Install CheckStyle

refer: http://martin-thoma.com/checkstyle/

install checkstyle.

```
sudo apt-get install checkstyle
```

declare the java path:

```
export JAVA_CMD=/usr/lib/jvm/java-8-oracle/bin/java
```


### Install sidebar

```
sudo apt-get install android-tools-adb
```

### Set up Android Emulator

refer:
- http://developer.android.com/tools/testing/testing_otheride.html#RunTestsDevice
- [Manage android AVD by cmdline](http://developer.android.com/tools/devices/managing-avds-cmdline.html)
- [Using android AVD by cmdline](http://developer.android.com/tools/devices/emulator.html)
- [Install ABIs before create AVD](http://stackoverflow.com/questions/10019532/no-abi-error-when-creating-an-android-virtual-device)


### start Emulator

if you hit **'SDL init failure, reason is: No available video device'**

Login Ubuntu from GUI


Add Jenkins Slave
------------------

### Manage jenkins nodes

refer: https://wiki.jenkins-ci.org/display/JENKINS/Step+by+step+guide+to+set+up+master+and+slave+machines
