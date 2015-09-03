Debug
=====

### LogCat

It is a good practice to use Log.d() and LogCat to debug at Development.
But you should not call any Log.d() or Log.i() in the release version!!

### Memory Leak Debug Tool

On Android Studio, We can use Android Device Monitor to analysis the allocated memory.

`Tools >> Android >> Android Device Monitor`

![android_device_monitor](./Images/Testing/android_device_monitor.png)


**Hint:** On Eclipse, you can try to use MAT - Memory Analyzer.


### BugSense ([Splunk MINT](https://mint.splunk.com/))


The Splunk MINT SDK will collect crash, performance and usage data for your app and send it to our Cloud servers.

Disadvantages:
- It require Internet Permission, and always connect to the Internet.
- It only provide the record when Exception happens. sometimes, it is not enough for debugging.

![BugSense](./Images/Testing/bugsense.png)

**Note:** I can not register Splunk MINT for free use...

**Hint**  [ACRA](https://github.com/ACRA/acra) is a Open Source project similar to BugSense. The License is Apache 2.0.

### Store Runtime Application Log to File

use standard java.util.logging log to write log to file at runtime.
Note that:
- Let user can select turn on logging or not.
- You should delete old records to control the file size.
- Let user can upload the record file when Error happen.
