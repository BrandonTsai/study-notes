Gitlab + Jenkins
=================


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

**Install JAva JRE & Oracle JDK:**

refer: https://www.digitalocean.com/community/tutorials/how-to-install-java-on-ubuntu-with-apt-get

**Install git:**

    $ sudo apt-get install git


### Install android sdk

    $ wget http://dl.google.com/android/android-sdk_r24.3.4-linux.tgz

    $ tar zxvf android-sdk_r24.3.4-linux.tgz

    $ cd android-sdk-linux/tools
    $ sudo ./android update sdk -u
    $ sudo ./android update sdk -u --all --filter build-tools-21.1.2

If you working on UBUNTU 64 Bit: You have to install these packages to solve errors because Android SDK still support UBUNTU 64 Bit.

    $ sudo apt-get install lib32stdc++6 lib32z1


Declare the sdk path:

created a file called local.properties and put inside

    sdk.dir=/path_to/android-sdk-linux

Or

    export ANDROID_HOME=/path_to/android-sdk-linux

### Install gradle

refer: http://linuxg.net/how-to-install-gradle-2-1-on-ubuntu-14-10-ubuntu-14-04-ubuntu-12-04-and-derivatives/

<br>
**Gradle Usage:**
- [Gradle User Guide](https://docs.gradle.org/current/userguide/userguide.html)
- **build apk:** gradle assemble

### Install CheckStyle

refer: http://martin-thoma.com/checkstyle/


Add Jenkins Slave
------------------

### Manage jenkins nodes

refer: https://wiki.jenkins-ci.org/display/JENKINS/Step+by+step+guide+to+set+up+master+and+slave+machines

### Declare Job run on specific slave node

Configure job

--> select `Restrict where this project can be run`

--> specify the Label of the slave node.



Create New Jenkins Job
-----------------------

### Source Code Management

select `Git`,

Input the Gitlab Project Repository URL & Credential.


### Build Triggers:

select `Poll SCM`

### Build Command

execute shell

```
cp ~/local.properties ./
sudo gradle assemble
checkstyle -c ~/checkstyle.xml -r ./app/src/main/java/
```


Set up Gitlab server
--------------------

### Web Hooks

- **URL:** `http://yourserver/git/notifyCommit?url=<URL of the Git repository>[&branches=branch1[,branch2]*][&sha1=<commit ID>]`. please refer: https://wiki.jenkins-ci.org/display/JENKINS/Git+Plugin
- **Trigger:**  Select `Push event`

### Add Jenkins Job Status to Wiki:

**On Jenkins:**

Open the job page:

--> on the left sidebar, click the  *Embeddable Build Status*

--> Copy the *"unprotected link path"* in *Markdown (with view)*. The link is similar to `[![Build Status](http://172.16.X.X:8080/buildStatus/icon?job=test)](http://172.16.X.X:8080/job/test/)`


**On Gitlab:**

Open the wiki page of your project.

--> paste the *"unprotected link path"* on the new wiki page.

--> Save and see the jobs result.
