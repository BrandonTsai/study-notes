MySQL
=====



Backup & Restore
----------------

refer: http://dba.tw/index.php?topic=137.0

備份某個資料庫
```
$ mysqldump -u root -p db_name > backup.sql;
```

備份資料庫中的某個資料表
```
$ mysqldump -u root -p db_name table_name > backup.sql;
```

備份所有資料庫
```
$ mysqldump -u root -p --all-databases > backup.sql;
```

復原一個資料庫 (需先建好db_name 這個資料庫, 若沒建立請先執行 mysqladmin create db_name 建立即可)
```
$ mysql -u root -p db_name < backup.sql
```

復原多個資料庫 ( 因為backup.sql 內已有 CREATE DATABASE指令,因此不需先建DB)
```
$ mysql -u root -p < backup.sql 
```
注意:
因為新版mysqldump預設會使用UTF8,所以還原較沒問題, 若為舊版的mysqldump, 則需要使用--default-character-set 指定字集
```
$ mysql -u root -p --default-character-set=latin1 db_name < backup.sql
```
