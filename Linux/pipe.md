# Basic Pipe Command

refer: 
- http://linux.vbird.org/linux_basic/0320bash.php#pipe
- http://linux.vbird.org/linux_basic/0220filemanager.php

## 取值

### Head

取出前面幾行

| Option | Action   |
|--------|----------|
| -n num | 取出前面n行 |


### Tail

取出後面幾行

| Option | Action   |
|--------|----------|
| -n num | 取出後面n行 |
| -f     | Keep output appended data as the file grows; <br> Press 'Ctrl+c' to exit |


### Grep


| Option | Action   |
|--------|----------|
| -i     | 忽略大小寫|
| -n     | 顯示行數  |
| -v abc | 過濾 abc  |
| -A x   | 後面x列   |
| -B y   | 前面y列   |


### Cut


| usage                       | notes                |
|-----------------------------|----------------------|
| cut -d '分隔字元' -f fields  | field從 1 開始計數     |
| cut -c A-B                  | 取每一行第Ａ到第Ｂ個字元 |
 

```
$ cat >> phone_book << EOF
> tsungyi 03-1234567
> brandon 03-7654321
> batman 05-1234321
> EOF

$ cat phone_book | cut -d ' ' -f 1
tsungyi
brandon
batman

$ cat phone_book | cut -c 1-5
tsung
brand
batma

```


### AWK

refer: http://blog.xuite.net/mb1016.flying/linux/28111008-linux+shell+awk+語法

進階版的cut

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
- 邏輯運算 ：`> , < , >= , <= , == , !=`
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


通常跟 sort 及 uniq 一起用
 
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


### sort

refer:
- http://www.cyberciti.biz/faq/unix-linux-shell-script-sorting-ip-addresses/


| options | notes |
| ------- | ----- | 
| -t ＜separator＞| Set field separator |
| -k BEGIN[,END]  | Sort data / fields using the given BEGIN column number to END column number. |
| -n 		  | Makes the program sort according to numerical value |
| -r              | reverse sort |

**sort ip address**:

```
$ cat >> ips <<EOF 
10.0.0.4
10.0.1.5
10.0.0.3
10.0.1.11
10.0.1.12
10.0.0.11
10.0.0.12
EOF


$ sort -t . -k 1,1n -k 2,2n -k 3,3n -k 4,4n ips
10.0.0.3
10.0.0.4
10.0.0.11
10.0.0.12
10.0.1.5
10.0.1.11
10.0.1.12

$ sort -t . -k 1,1nr -k 2,2nr -k 3,3nr -k 4,4nr ips
10.0.1.12
10.0.1.11
10.0.1.5
10.0.0.12
10.0.0.11
10.0.0.4
10.0.0.3

```


### uniq 

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


## 重導向

### tee [-ai] [file]

tee 會同時將資料流分送到檔案去與螢幕 (screen)；而輸出到螢幕的，其實就是 stdout ，可以讓下個指令繼續處理喔！

| optioon | notes |
| ------- | ------|
| -a      | Append the output to the files rather than overwriting them. |
| -i      | Ignore the SIGINT signal. |


```

$ cat phone_book | tee -a new_book | grep brandon
brandon 03-7654321

$ cat new_book 
tsungyi 03-1234567
brandon 03-7654321
batman 05-1234321


```
