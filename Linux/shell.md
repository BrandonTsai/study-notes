Shell Scrips
============

please refer:
- http://linux.vbird.org/linux_basic/0320bash.php
- http://linux.vbird.org/linux_basic/0340bashshell-scripts.php

Condition
---------


### If

```bash
if [ condition1 ]; then

elif [ condition2 ]

else

fi
```

### case

```bash
case $var in
    'value1' )
        # ...
        ;;
    'value2' )
        # ...
        ;;
esac
```	



### for

refer: http://www.cyberciti.biz/faq/bash-for-loop/

```bash
for VARIABLE in file1 file2 file3
do
  # echo $VARIABLE
done

for VARIABLE in $(ls /tmp/)
do
  # echo $VARIABLE
done


for i in {1..5}
do
   # echo "Welcome $i times"
done

# $INCREMENT deault = 1
for i in $(seq $BEGIN $INCREMENT $END)
do
   echo "get $i "
done


for (( c=1; c<=5; c++ ))
do
   echo "Welcome $c times"
done


for (( ; ; ))
do
   echo "infinite loops [ hit CTRL+C to stop]"
done

```

### while

```bash
while [ condition ] 
do
  # ...
done 
```

Computation
-----------


**var=$((運算內容))**

```bash
num=$(( 13 % 3 ))
```

Input
-----

### argv

**$#** : the num of argv 

```bash
echo $0 $1 $2
```

### read

```bash
read -p "Are you crazy? [Y/N]:" answer
```
### getopts

Refer: http://wiki.bash-hackers.org/howto/getopts_tutorial

```bash
while getopts ":u:p:h" opt; do
    case $opt in
        u)
            USER=$OPTARG
            ;;
        p)
            PASSWORD=$OPTARG
            ;;
        h)
            echo "./$0 -u <name> -p <password>"
            exit 1
            ;;
        \?)
            echo "Invalid option: -$OPTARG"
            echo "./$0 -u <name> -p <password>"
            exit 1
            ;;
    esac
done
```

Output Log
----------

refer: 

- http://stackoverflow.com/questions/18460186/writing-outputs-to-log-file-and-console
- http://www.tldp.org/LDP/abs/html/io-redirection.html


| operator | notes |
| -------- | ----- |
| 0        | 標準輸入 |
| 1        | 標準輸出 |
| 2        | 標準錯誤 |


| usage | notes |
| ----- | ----- |
| 1>filename | Redirect stdout to file "filename." |
| 2>filename | Redirect stderr to file "filename." |
| &>filename | Redirect both stdout and stderr to file "filename." |
| 2>&1       | Redirects stderr to stdout. | 


```bash
exec 3>&1 1>>${LOG_FILE} 2>&1
would send stdout and stderr output into the log file, but would also leave you with fd 3 connected to the console, so you can do

echo "Some console message" 1>&3
to write a message just to the console, or

echo "Some console and log file message" | tee /dev/fd/3
to write a message to both the console and the log file - tee sends its output to both its own fd 1 (which here is the LOG_FILE) and the file you told it to write to (which here is fd 3, i.e. the console).

Example:

exec 3>&1 1>>${LOG_FILE} 2>&1

echo "This is stdout"
echo "This is stderr" 1>&2
echo "This is the console (fd 3)" 1>&3
echo "This is both the log and the console" | tee /dev/fd/3
would print

This is the console (fd 3)
This is both the log and the console
on the console and put

This is stdout
This is stderr
This is both the log and the console
into the log file.
```


run command on background
-------------------------

use **wait** to wait for all command run finish 

```bash
command1 &
command2 &
wait
```


String Handling
----------------

### Divide String

```bash
${MYVAR#pattern}       # delete shortest match of pattern from the beginning
${MYVAR##pattern}      # delete longest match of pattern from the beginning
${MYVAR%pattern}       # delete shortest match of pattern from the end
${MYVAR%%pattern}      # delete longest match of pattern from the end
```
