# File

## Search File

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
