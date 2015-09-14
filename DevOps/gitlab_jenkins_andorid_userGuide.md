Gitlab + Jenkins + Android -  User Guild
=========================================

Create New Jenkins Job
-----------------------

### create freestyle project

![](./images/jenkins_add_job_1.png)

### Restrict build slave

input *"Android"* to Label field.

![](./images/jenkins_add_job_label.png)


### Source Code Management

Input the Gitlab Project Repository URL & Credential.

The Credential can set up by username/password of gitlab user.

or use the *"private key"*

![](./images/jenkins_add_job_git.png)


### Build Triggers:

select `Poll SCM`

![](./images/jenkins_add_job_build_triggers.png)

### Build Command

![](./images/jenkins_add_job_build_shell.png)

use execute shell


for Eclipse to android studio project:
```
cp -r ~/studio_project /tmp/vitalsign
cp -r ./* /tmp/vitalsign/app/
cd /tmp/vitalsign/

checkstyle -c ~/studio_project/checkstyle.xml -r ./app/src/

sudo gradle assembleRelease -Pandroid.injected.signing.store.file=$ANDROID_KEYFILE -Pandroid.injected.signing.store.password=$ANDROID_STORE_PASSWORD -Pandroid.injected.signing.key.alias=$ANDROID_KEY_ALIAS -Pandroid.injected.signing.key.password=$ANDROID_KEY_PASSWORD

sudo gradle assembleDebug
sudo gradle assembleDebugAndroidTest


ls /tmp/vitalsign/app/build/outputs/apk/*unaligned.apk | xargs -i adb -e install {}

sudo adb shell am instrument -w com.quanta.vitalsign.test/android.support.test.runner.AndroidJUnitRunner

adb uninstall com.quanta.vitalsign
adb uninstall com.quanta.vitalsign.test

cd ~
sudo rm -r /tmp/vitalsign/
```

command reference:
- [Gradle](http://tools.android.com/tech-docs/new-build-system/user-guide)
- [adb](http://developer.android.com/tools/help/adb.html)


Set up Gitlab server
--------------------

### Web Hooks

- **URL:** `http://<Jenkins Server IP>/git/notifyCommit?url=<URL of the Git repository>[&branches=branch1[,branch2]*][&sha1=<commit ID>]`. please refer: https://wiki.jenkins-ci.org/display/JENKINS/Git+Plugin
- **Trigger:**  Select `Push event`

![](./images/gitlab_web_hooks.png)


### Deploy keys

Create a new Deploy Key with the *"public key"*.

![](./images/gitlab_deploy_key_new.png)

or enable other project's keys

![](./images/gitlab_deploy_key_enable.png)

### Add Jenkins Job Status to Project's Wiki:

**On Jenkins:**

Open the job page:

--> on the left sidebar, click the *"Embeddable Build Status"*

--> Copy the *"unprotected link path"* in *Markdown (with view)*. The link is similar to `[![Build Status](http://172.16.X.X:8080/buildStatus/icon?job=test)](http://172.16.X.X:8080/job/test/)`


![](./images/jenkins_build_status.png)

**On Gitlab:**

Open the wiki page of your project.

--> paste the *"unprotected link path"* on the new wiki page to see the jobs result.

--> Also paste `http://[jenkins_server]/job/[job-name]/lastBuild/console` to link to the console out quickly.


result is simlilar to this:

![](./images/gitlab_wiki.png)
