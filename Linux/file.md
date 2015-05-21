File
====

Search File
-----------

refer: http://linux.vbird.org/linux_basic/0220filemanager.php#file_find

### which (尋找『執行檔』)

locate a **"program"** file in the user's **"PATH"**

```
$ which -a cd 
/usr/bin/cd
```


### locate

| options | notes  |
| ------- | ------ |
| -i      | Ignore case distinctions |


* locate 尋找的資料是由『已建立的資料庫 /var/lib/mlocate/』
* 資料庫的建立預設是在每天執行一次
* 更新 locate 資料庫的方法非常簡單，直接輸入『 updatedb 』就可以了. 
	* MAC: run "/usr/libexec/locate.updatedb"
* locate can not find file in specified folder


```
$ locate locate.updatedb 
/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk/usr/share/man/man8/locate.updatedb.8
/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk/usr/share/man/man8/locate.updatedb.8
/usr/libexec/locate.updatedb
/usr/share/man/man8/locate.updatedb.8

$ locate -i Locate.UpDatedb 
/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk/usr/share/man/man8/locate.updatedb.8
/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.9.sdk/usr/share/man/man8/locate.updatedb.8
/usr/libexec/locate.updatedb
/usr/share/man/man8/locate.updatedb.8
```


### Find

find PATH [options]

| Options | Desciption |
| ------- | ---------- |
| -name   | return files if the filename being examined matches pattern. |
| -type   |  文件是某類型的。 d 目錄 ; f 普通文件 |
| -d      | depth; 要找第幾層的 |




```
$ find ./ -name "*.md"
.//Database/postgreSQL.md
.//Linux/fabric.md
.//Linux/file.md
.//Linux/pipe.md
.//Linux/shell.md
.//Others/git.md
.//README.md
.//SUMMARY.md

$ find ./ -d 1 -name "*.md"
.//README.md
.//SUMMARY.md


$ find /etc/apache2/ -type d
/etc/apache2/
/etc/apache2//extra
/etc/apache2//original
/etc/apache2//original/extra
/etc/apache2//other
/etc/apache2//users

$ find /etc/apache2/ -d 1 -type f
/etc/apache2//httpd.conf
/etc/apache2//magic
/etc/apache2//mime.types

```

Create File:
-----------

### dd

refer: http://nathan-inlinux.blogspot.tw/2013/05/linux-dd.html

| 參數名稱 | 說明 |
| ------- | --- |
| if      | 英文為 input file，表示指定讀取來源，預設為 stdin|
| of      | 英文為 output file，表示指定寫入目的，預設為 stdout |
| bs      | 英文為 block size，表示讀入與寫入的大小 |
| count   | 表示處理的次數 |


create a 500M testfile
```
$ dd if=/dev/zero of=/tmp/testfile bs=1M count=500 
```

copy entire disk:
```
$ dd if=/dev/vda of=/dev/vdb bs=4096k
```

Monitor File Changes
--------------------

### incron

refer:
- http://inotify.aiken.cz/?section=incron&page=doc&lang=en

Installation:
```bash
# apt-get install incron
```

then add configurations under **/etc/incron.d**

with syntax format:

**＜path＞ ＜mask＞ ＜command＞**

Where:


- *＜path＞*    is a filesystem path (each whitespace must be prepended by a backslash)
- *＜mask＞*    is a symbolic (see inotify.h; use commas for separating symbols) or numeric mask for events
- *＜command＞* is an application or script to run on the events


For example: 

use incron monitor the files under /root/study-notes/, 
if any file changes, run the update-manual.sh script automatically 
to update the website.

/etc/incron.d/study-notes.conf
```
/root/study-notes IN_MODIFY /root/update-manual.sh
/root/study-notes/BigData IN_MODIFY /root/update-manual.sh
/root/study-notes/Database IN_MODIFY /root/update-manual.sh
/root/study-notes/Linux IN_MODIFY /root/update-manual.sh
/root/study-notes/Linux/Debian IN_MODIFY /root/update-manual.sh
/root/study-notes/OpenStack IN_MODIFY /root/update-manual.sh
/root/study-notes/Others IN_MODIFY /root/update-manual.sh
/root/study-notes/PRIVATE IN_MODIFY /root/update-manual.sh
```

