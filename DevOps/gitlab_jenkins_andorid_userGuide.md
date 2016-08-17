Gitlab + Jenkins -  User Guild
================================

Set up Gitlab server
--------------------

#### Web Hooks

- **URL:** `http://<Jenkins Server IP>/git/notifyCommit?url=<URL of the Git repository>[&branches=branch1[,branch2]*][&sha1=<commit ID>]`. please refer: https://wiki.jenkins-ci.org/display/JENKINS/Git+Plugin
- **Trigger:**  Select `Push event` and `Merge Request events`

![](./images/webhooks.png)


#### Deploy keys

 enable deployment key

![](./images/gitlab_deploy_key.png)


<br><p style="page-break-after:always"></p>
Create New Jenkins Job
-----------------------

#### create freestyle project

![](./images/jenkins_add_job_1.png)

#### Restrict build slave

input *"AndroidTest"* to Label field.

![](./images/jenkins_slave_label.png)


#### Source Code Management

Input the Gitlab Project Repository URL & Branch.

Credential: select **"deployment"**

![](./images/jenkins_git.png)


#### Build Triggers:

select `Poll SCM`

![](./images/jenkins_trigger.png)


#### Build Command

use execute shell to run your test scripts

![](./images/jenkins_shell.png)

command reference for android:
- Gradle: http://tools.android.com/tech-docs/new-build-system/user-guide
- adb: http://developer.android.com/tools/help/adb.html


<br><p style="page-break-after:always"></p>
(Optional) Add Jenkins Job Status to Project's Wiki
---------------------------------------------------

**On Jenkins:**

Open the job page:

--> on the left sidebar, click the *"Embeddable Build Status"*

--> Copy the *"unprotected link path"* in *Markdown (with view)*. The link is similar to `[![Build Status](http://172.16.X.X:9999/buildStatus/icon?job=test)](http://172.16.X.X:8080/job/test/)`

![](./images/jenkins_status.png)

**On Gitlab:**

Open the wiki page of your project.

--> paste the *"unprotected link path"* on the new wiki page to see the jobs result.

--> Also paste `http://[jenkins_server]/job/[job-name]/lastBuild/console` to link to the console output quickly.

![](./images/gitlab_wiki_content.png)

result is simlilar to this:

![](./images/gitlab_wiki_result.png)
