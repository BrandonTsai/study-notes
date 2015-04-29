# Rsync

refer:
- http://newsletter.ascc.sinica.edu.tw/news/read_news.php?nid=1742
- http://linux.vbird.org/linux_server/0310telnetssh.php#ssh_nopasswd


Introduction
------------

rsync的優點
* 可以進行增量備份，不怕備份中斷，節省備份時間。
* 傳輸過程中，可以利用ssh將資料加密。
* open source的軟體，可以跨平台使用。

rsync的缺點
* 遇到檔案數或目錄層數多的時候，效率較差。檔案數達到一定的數量，rsync可能無法執行。
* 使用時要小心，避免覆蓋到想要保留的資料。

rsync的運作模式　
* Sync Local Folder
* Sync Remote Folder through rsh/ssh
* Sync through daemon


rsync [options] SRC DEST

| Options  | Description |
| -------- | ----------- |
| -a       | archive mode: recursive, preserve permissions, symlinks...  |
| -e       | specify the remote shell to use |
| --delete | 若目錄SRC下有檔案或目錄被刪除，會同步反應在目錄DEST | 



Sync Local Folder
-----------------

將 /home/user1 的資料備份到 /home/user2 內

```bash
rsync -av --delete /home/user1 /home/user2 
```

Sync Remote Folder through rsh/ssh
----------------------------------

將 remote server 的 /home/user1 備份到本地主機的 /home/user2 內

```bash
rsync -av --delete -e ssh user@remote_server_ip:/home/user1 /home/user2
```

Sync through daemon
-------------------

Reference: https://help.ubuntu.com/community/rsync
the “target” should be also set up the /etc/rsyncd.conf


