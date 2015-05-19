Local Storage
=============


Disk
----

refer:
- http://linux.vbird.org/linux_basic/0130designlinux.php
- http://www.serialstoragewire.net/Articles/2004_0225/main_theme_feb.html

### SATA vs. SAS:

![SATA vs. SAS](http://www.serialstoragewire.net/images/articles/interface_comparison.gif)

SATA/USB介面的磁碟根本就沒有一定的順序，那如何決定他的裝置檔名呢？ 這個時候就得要根據Linux核心偵測到磁碟的順序了！


Partition
---------

refer:
- http://linux.vbird.org/linux_basic/0130designlinux.php
- http://linux.vbird.org/linux_basic/0230filesystem.php

### Primary, Extended and Logical Partition

由於分割表就只有64 bytes而已，最多只能容納四筆分割的記錄， 這四個分割的記錄被稱為主要(Primary)或延伸(Extended)分割槽。 

由延伸分割繼續切出來的分割槽，就被稱為邏輯分割槽(logical partition)。

### fdisk

fdisk ＜Device Path＞

```
# fdisk /dev/vdb 
Device contains neither a valid DOS partition table, nor Sun, SGI or OSF disklabel
Building a new DOS disklabel with disk identifier 0xe9e08ac8.
Changes will remain in memory only, until you decide to write them.
After that, of course, the previous content won't be recoverable.

Warning: invalid flag 0x0000 of partition table 4 will be corrected by w(rite)

Command (m for help):
```

Create a new Primary partition and a new extended partition:

```
Command (m for help): n
Partition type:
   p   primary (0 primary, 0 extended, 4 free)
   e   extended
Select (default p): p
Partition number (1-4, default 1): 
Using default value 1
First sector (2048-104857599, default 2048): 
Using default value 2048
Last sector, +sectors or +size{K,M,G} (2048-104857599, default 104857599): +5G

Command (m for help): n
Partition type:
   p   primary (1 primary, 0 extended, 3 free)
   e   extended
Select (default p): e
Partition number (1-4, default 2): 
Using default value 2
First sector (10487808-104857599, default 10487808): 
Using default value 10487808
Last sector, +sectors or +size{K,M,G} (10487808-104857599, default 104857599): +5G


Command (m for help): w
The partition table has been altered!
Calling ioctl() to re-read partition table.
Syncing disks.
```

delete old partition:
```
Command (m for help): d
Partition number (1-5): 2


Command (m for help): w
The partition table has been altered!
Calling ioctl() to re-read partition table.
Syncing disks.
```


list current partition:
```
Command (m for help): p
Disk /dev/vdb: 53.7 GB, 53687091200 bytes
16 heads, 63 sectors/track, 104025 cylinders, total 104857600 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x38e4acac

   Device Boot      Start         End      Blocks   Id  System
/dev/vdb1            2048    52400000    26198976+  83  Linux
```



Filesystm
---------

refer:
- http://linux.vbird.org/linux_basic/0230filesystem.php


檔案系統通常會將 權限與屬性放置到 inode 中，至於實際資料則放置到 data block 區塊中。


**data block (資料區塊)**
data block 是用來放置檔案內容資料地方，

- 在 Ext2 檔案系統中所支援的 block 大小有 1K, 2K 及 4K 三種而已。
  - 4K data block size can support max 2TB file and max total 16TB files
  - 若檔案小於 block ，則該 block 的剩餘容量就不能夠再被使用了(磁碟空間會浪費)。
- 在格式化時 block 的大小就固定了
- 每個 block 都有編號，以方便 inode 的記錄啦。


**inode table (inode 表格)**
系統讀取檔案時需要先找到 inode，並分析 inode 所記錄的權限與使用者是否符合，若符合才能夠開始實際讀取 block 的內容。

- inode 的數量與大小也是在格式化時就已經固定了
- 每個 inode 大小均固定為 128 bytes；
- 每個檔案都僅會佔用一個 inode 而已；


**資料的不一致 (Inconsistent) 狀態**
因為不知名原因導致系統中斷(例如突然的停電啊、 系統核心發生錯誤啊～等等的怪事發生時)，所以寫入的資料僅有 inode table 及 data block 而已， 最後一個同步更新中介資料的步驟並沒有做完，此時就會發生 metadata 的內容與實際資料存放區產生不一致 (Inconsistent) 的情況了。

**日誌式檔案系統 (Journaling filesystem)**
為了避免上述提到的檔案系統不一致的情況發生，因此我們的前輩們想到一個方式， 如果在我們的 filesystem 當中規劃出一個區塊，該區塊專門在記錄寫入或修訂檔案時的步驟，


### mkfs : format partition

```
# mkfs [-t 檔案系統格式] 裝置檔名
選項與參數：
-t  ：可以接檔案系統格式，例如 ext4, ntfs 等(系統有支援才會生效)

```


Mount
-----

掛載點一定是目錄，該目錄為進入該檔案系統的入口。






Other
-----

### df : 列出檔案系統的整體磁碟使用量 

```
# df [-ahikHTm] [Mount-Point]
選項與參數：
-a  ：列出所有的檔案系統，包括系統特有的 /proc 等檔案系統；
-h  ：以人們較易閱讀的 GBytes, MBytes, KBytes 等格式自行顯示；
-T  ：連同該 partition 的 filesystem 名稱 (例如 ext3) 也列出；
-i  ：不用硬碟容量，而以 inode 的數量來顯示

# df -Th
Filesystem     Type      Size  Used Avail Use% Mounted on
/dev/vda1      ext4       25G  7.0G   17G  30% /
none           tmpfs     4.0K     0  4.0K   0% /sys/fs/cgroup
udev           devtmpfs  991M   12K  991M   1% /dev
tmpfs          tmpfs     201M  408K  200M   1% /run
none           tmpfs     5.0M     0  5.0M   0% /run/lock
none           tmpfs    1001M     0 1001M   0% /run/shm
none           tmpfs     100M     0  100M   0% /run/user
```


### du：評估檔案或目錄所使用容量

```
du [-ahskm] 檔案或目錄名稱
選項與參數：
-a  ：列出所有的檔案與目錄容量，因為預設僅統計目錄底下的檔案量而已。
-h  ：以人們較易讀的容量格式 (G/M) 顯示；
-s  ：列出總量而已，而不列出每個各別的目錄佔用容量；
-S  ：不包括子目錄下的總計，與 -s 有點差別。

# du -sh ./study-notes/
1.2M	./study-notes/

# du -ah ./study-notes/Linux/
4.0K	./study-notes/Linux/PXE.md
4.0K	./study-notes/Linux/network.md
4.0K	./study-notes/Linux/system_health.md
4.0K	./study-notes/Linux/ipmitool.md
4.0K	./study-notes/Linux/pipe.md
4.0K	./study-notes/Linux/Debian/local_repo.md
8.0K	./study-notes/Linux/Debian
4.0K	./study-notes/Linux/shell.md
4.0K	./study-notes/Linux/rsync.md
4.0K	./study-notes/Linux/file.md
8.0K	./study-notes/Linux/partition.md
72K	./study-notes/Linux/

```



