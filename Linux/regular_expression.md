Regular Expression
==================

refer:
- http://linux.vbird.org/linux_basic/0330regularex.php#before

| Character | 代表意義 |
| --------- | -------- |
| [:alnum:] |  	代表英文大小寫字元及數字，亦即 0-9, A-Z, a-z |
| [:alpha:] |  	代表任何英文大小寫字元，亦即 A-Z, a-z |
| [:blank:] |  	代表空白鍵與 [Tab] 按鍵兩者 |
| [:cntrl:] |  	代表鍵盤上面的控制按鍵，亦即包括 CR, LF, Tab, Del.. 等等 | 
| [:digit:] |  	代表數字而已，亦即 0-9 | 
| [:graph:] |  	除了空白字元 (空白鍵與 [Tab] 按鍵) 外的其他所有按鍵 | 
| [:lower:] |  	代表小寫字元，亦即 a-z | 
| [:print:] |  	代表任何可以被列印出來的字元 | 
| [:punct:] |  	代表標點符號 (punctuation symbol)，亦即：" ' ? ! ; : # $... | 
| [:upper:] |  	代表大寫字元，亦即 A-Z | 
| [:space:] |  	任何會產生空白的字元，包括空白鍵, [Tab], CR 等等 | 
| [:xdigit:] | 	代表 16 進位的數字類型，因此包括： 0-9, A-F, a-f 的數字與字元 | 


行首 (^) 與 行尾 ($)
-------------------

| Character | 代表意義 |
| --------- | -------- |
| ^this     | search 位於行首的`this` |
| food$     | search 位於行尾的`food` |


[]: 搜尋單一字元
----------------------------

利用中括號 [] 來搜尋單一集合字元
如果我有特定字元的話呢？此時，可以利用在集合字元的反向選擇 [^] 來達成

| Character | 代表意義 |
| --------- | -------- |
| `[fg]ood`        | search `food`, `good` |
| `[^g]ood`        | filter `good` |
| `[a-z]ood`       | search `aood`, `bood`, `cood`, ... |
| `[0-9]ood`       | search `0ood`, `1ood`, `2ood`, ... |
| `[a-zA-Z0-9]ood` | search `aood`, ..., `Aood`, ..., `0ood`, ... |
| `[[:alnum:]]ood` | 同上 |
| `[A-Z]`          | search Character `A`, `B`, `C`, ... |


任意一個字元 (.) 
--------------

| Character | 代表意義 |
| --------- | -------- |
| `.ood`    | similar to `[[:print:]]ood` |


重複字元 (*)
------------

\* 代表的是『重複 0 個或多個前面的字符
 
| Character | 代表意義 |
| --------- | -------- |
| `go*d`    | search `gd`, `god`, `good`, `goood`, ... |
| `goo*d`   | search `god`, `good`, `goood`, ... |
| `gooo*d`  | search `good`, `goood`, ... |
| `g.*d`    | similar `g[[:print:]]*d` |
| `[0-9][0-9]*` | search 任意數字 |


\{X,Y\} : 限定連續X~Y個字符
----------------------------
| Character | 代表意義 |
| --------- | -------- |
| `[x,y]\{2,3\}d` | search `xx`, `yy`, `xy`, `xxx`, `xxy`, `xyx`, ..., `yyy` |





