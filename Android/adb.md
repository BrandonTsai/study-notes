Advance adb usage
=================

dumpsys
-------

`adb shell dumpsys <SERVICE>` 可以查看 system service 當時的狀態跟細部資訊

至於 SERVICE 接受哪些值，可以用 `adb shell dumpsys -l` 或是 `adb shell service list` 來取得。

每個 SERVICE 後面帶的參數不同，通常可以用 `dumpsys <SERVICE> -h` 查詢完整的用法。


| Service | Usage |
| ------- | ----- |
| `package [<PACKAGE_NAME>]` | get package info. Like  versionName, grantedPermissions, ...|



ps
---

`adb shell ps [<PID>]` 可以印出所有或特定 process 的資訊，包括 PID (Process ID)、PPID (Parent PID)、threads 還有執行身份等。

常用的 OPTION 有：

| Option| usage |
| ----- | ----- |
| -t    | 印出 threads。|


getprop
--------

refer: http://blog.csdn.net/haixia_12/article/details/40857721


`adb shell getprop` 列出所有配置属性值

| Command | Usage |
| ------- | ----- |
| getprop [key] | 取得对应的key的属性值 |
| setprop [key] [value] | 设置指定key的属性值；|
| watchprops |   监听系统属性的变化，如果期间系统的属性发生变化则把变化的值显示出来|

常見用途：

| Command | Usage |
| ------- | ----- |
| getprop ro.build.display.id | get firmware/BSP version |


am (activity manager)
---------------------

refer: https://developer.android.com/studio/command-line/shell.html#am

| Command | Usage |
| ------- | ----- |
| `start [options] <INTENT>` | start an activity |
| `startservice [options] <INTENT>` | Start the Service|
| `broadcast [options] <INTENT>` | Issue a broadcast intent. |


screencap & screenrecord
------------------------

| Command | Usage |
| ------- | ----- |
| `adb shell screencap /sdcard/screen.png` | Taking a device screenshot |
| `adb shell screenrecord /sdcard/demo.mp4` | Recording a device screen |
