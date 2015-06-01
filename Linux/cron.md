Job Scheduling
===============

refer: http://linux.vbird.org/linux_basic/0430cron.php

Cron
----

### ACL:

我們可以限制使用 crontab 的使用者帳號喔！使用的限制資料有：

`/etc/cron.allow` :
將可以使用 crontab 的帳號寫入其中，若不在這個檔案內的使用者則不可使用 crontab；

`/etc/cron.deny` :
將不可以使用 crontab 的帳號寫入其中，若未記錄到這個檔案當中的使用者，就可以使用 crontab 。

優先順序來說， /etc/cron.allow 比 /etc/cron.deny 要優先


### Job Configuration:

add Configuration file under:

* /etc/cron.d/
* /etc/cron.hourly/
* /etc/cron.daily/
* /etc/cron.weekly/
* /etc/cron.monthly/


**Format:**

`<分> <時> <日> <月> <週> <指令>`

| Value | Means |
| ----- | ----- |
| \*   | 代表任何時刻都接受的意思！|
| a,b | 代表分隔時段的意思。ex: 3,6 指在第 3 和第 6 這兩個值時執行此動作|
| a-b | 代表a到b這段時間範圍內 |
| /n  | 那個 n 代表數字，亦即是『每隔 n 單位間隔』的意思 | 



**Examples:** run test script ....


every 5 min: 
```
 */5 * * * * /home/ubuntu/test.sh
```

at 6:30 and 11:30
```
 30 6,11 * * * /home/ubuntu/test.sh
```
 
at 6:00, 7:00, 8:00, 9:00, 10:00, 11:00 
```
 0 6-11 * * * /home/ubuntu/test.sh
```

only run test every hour on Monday:
```
 0 * * * 1 /home/ubuntu/test.sh
```






