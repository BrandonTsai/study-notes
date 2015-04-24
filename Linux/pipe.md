# Basic Pipe Command

refer: http://linux.vbird.org/linux_basic/0320bash.php#pipe

## 取值

### Grep


| Option | Action   |
|--------|----------|
| -i     | 忽略大小寫	 |
| -n     | 顯示行數   |
| -v abc | 過濾 abc  |
| -A x   | 後面x行   |
| -B y   | 前面y行   |


### AWK

refer: http://blog.xuite.net/mb1016.flying/linux/28111008-linux+shell+awk+語法

基本用法：

- 預設的『欄位的分隔符號為 "空白鍵" 或 "[tab]鍵" 』！
- -F "新分隔符號"
- 每一行的每個欄位都是有變數名稱的，那就是 $1, $2... 等變數名稱。
- $0 代表『一整列資料』的意思



```
$ cat >> phone_book << EOF
> tsungyi 03-1234567
> brandon 03-7654321
> batman 05-1234321
> EOF

$ awk '{print $2}' ./phone_book 
03-1234567
03-7654321
05-1234321

$ awk -F '-' '{print $2}' ./phone_book 
1234567
7654321
1234321

```


加條件進階用法

- awk ' (條件) {print}'
- 邏輯運算 ：> , < , >= , <= , == , !=
- 使用布爾運算符 "||"（邏輯與）和 "&&"（邏輯或）
- ($1 ~ /正規表示式/) || ($1 !~ /正規表示式/)

```
$ awk '($1 == "brandon"){print $2}' ./phone_book 
03-7654321

$ awk '($1 == "brandon")||($1 == "batman"){print $2}' ./phone_book 
03-7654321
05-1234321

$ awk '($2 ~ /03-[0-9]*/) {print $2}' ./phone_book 
03-1234567
03-7654321

$ awk '($2 !~ /03-[0-9]*/) {print $2}' ./phone_book 
05-1234321

```

## 記數


### WC
 
$ wc [-lwm]

選項與參數：

- -l  ：僅列出行；
- -w  ：僅列出多少字(英文單字)；
- -m  ：多少字元；


```
$ cat phone_book | wc
       3       6      56
$ cat phone_book | wc -l
       3
$ cat phone_book | wc -w
       6
$ cat phone_book | wc -m
      56
```



### sort & uniq 

report or filter out consecutive repeated lines in a file

通常跟sort 並用

- -c : with the count of the number of times the line occurred in the input.
- -d : Only output lines that are repeated in the input.
- -u : Only output lines that are not repeated in the input.
- -i : Case insensitive comparison of lines.



```
$ cat > phone_book << EOF
> tsungyi 03-1234567
> brandon 03-7654321
> batman 05-1234321
> brandon 03-7654321
> tsungyi 03-1234567
> EOF


$ cat phone_book | sort
batman 05-1234321
brandon 03-7654321
brandon 03-7654321
tsungyi 03-1234567
tsungyi 03-1234567

$ cat phone_book | sort | uniq
batman 05-1234321
brandon 03-7654321
tsungyi 03-1234567

$ cat phone_book | sort | uniq -c
   1 batman 05-1234321
   2 brandon 03-7654321
   2 tsungyi 03-1234567

$ cat phone_book | sort | uniq -d
brandon 03-7654321
tsungyi 03-1234567

$ cat phone_book | sort | uniq -u
batman 05-1234321

```




