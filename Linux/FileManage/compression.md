Compression
===========

refer:
- http://linux.vbird.org/linux_basic/0240tarcompress.php
- http://www.dotblogs.com.tw/phoenixwu/archive/2008/05/22/4103.aspx


.gz
---

Compress and decompress single file:
```bash
$ gzip myfile
$ gzip -d myfile.gz
```

Recursive compress and decompress all files in a folder
```bash
$ gzip -r myfolder/
$ gzip -dr myfolder/
```

.bz2
-----

Only can compress single file.

Compression: `bzip2 <target-file>`

Decompression: `bzip2 -d <archive.bz2>`


.tar
---

壓缩：tar cvf FileName.tar DirName 

解壓：tar xvf FileName.tar 


.tar.gz
-------

壓缩：tar czvf FileName.tar.gz DirName 

解壓：tar xzvf FileName.tar.gz 


.zip
---
 

compression via zip command:

| Option  | notes |
| ------- | ----- |
| -r	  | recursively |
| -m      | Delete the originals <br> Move the specified files into the zip archive;|
| -P pass | Set up a password |

```
$ apt-get install zip
$ zip myfiles.zip file1 file2
$ zip -r myfiles.zip myfolder/
$ zip -r -m myfiles.zip myfolder/
$ zip -r -P mypassword myfiles.zip myfolder/
```

decompress a zip file vi unzip command
```
$ unzip myfiles.zip
```

