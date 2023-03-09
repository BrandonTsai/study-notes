

Question
==========

[](https://leetcode.com/problems/compare-version-numbers/)

Given two version numbers, version1 and version2, compare them.

Version numbers consist of one or more revisions joined by a dot '.'. Each revision consists of digits and may contain leading zeros. Every revision contains at least one character. Revisions are 0-indexed from left to right, with the leftmost revision being revision 0, the next revision being revision 1, and so on. For example 2.5.33 and 0.1 are valid version numbers.

To compare version numbers, compare their revisions in left-to-right order. Revisions are compared using their integer value ignoring any leading zeros. This means that revisions 1 and 001 are considered equal. If a version number does not specify a revision at an index, then treat the revision as 0. For example, version 1.0 is less than version 1.1 because their revision 0s are the same, but their revision 1s are 0 and 1 respectively, and 0 < 1.

Return the following:

If version1 < version2, return -1.
If version1 > version2, return 1.
Otherwise, return 0.
 

Example 1:

Input: version1 = "1.01", version2 = "1.001"
Output: 0
Explanation: Ignoring leading zeroes, both "01" and "001" represent the same integer "1".


Example 2:

Input: version1 = "1.0", version2 = "1.0.0"
Output: 0
Explanation: version1 does not specify revision 2, which means it is treated as "0".


Example 3:

Input: version1 = "0.1", version2 = "1.1"
Output: -1
Explanation: version1's revision 0 is "0", while version2's revision 0 is "1". 0 < 1, so version1 < version2.
 

Constraints:

1 <= version1.length, version2.length <= 500
version1 and version2 only contain digits and '.'.
version1 and version2 are valid version numbers.
All the given revisions in version1 and version2 can be stored in a 32-bit integer.



Hint
====

split and join
-------------

Python

```python
txt = "1.20.0.1"
arr = txt.split(".") # ['1', '20', '0', '1']
txt2 = '-'.join(arr) # 1-20-0-1
```

Go

```go
import "string"

txt := "1.20.0.1"
arr := strings.Split(txt, ".")
txt2 := strings.Join(str, "-")
```


Convert string to integer type
-----------

Python

```python
intVar = int("3")
```

go

You can use the `strconv` package's `Atoi()` function to convert the string into an integer value.

```go

import (
	"fmt"
	"strconv"
)

func main() {
	strVar := "100"
	intVar, err := strconv.Atoi(strVar)
	fmt.Println(intVar, err)
}

```


Answer
=======

Approach: Fill shorter array with default value 0

Python

Using [`zip_longest`](https://docs.python.org/3/library/itertools.html#itertools.zip_longest) function

```python
from itertools import zip_longest
class Solution:
    def compareVersion(self, version1: str, version2: str) -> int:
        v1 = [int(n) for n in version1.split('.')]
        v2 = [int(n) for n in version2.split('.')]
        
        for sv1, sv2 in zip_longest(v1, v2, fillvalue=0):
            if sv1 < sv2:
                return -1
            elif sv1 > sv2:
                return 1
        return 0
```
Go

Go do not have `itertools` module,
We have to fill the short array manually


```go
import (
    "strings"
    "strconv"
)

func compareVersion(version1 string, version2 string) int {
    v1 := strings.Split(version1, ".")
    v2 := strings.Split(version2, ".")

    // fill shorter array
    n1 := len(v1)
    n2 := len(v2)
    if n1 < n2 {
        for i := 0; i < n2-n1; i++ {
            v1 = append(v1, "0")
        }
    } else {
        for i := 0; i < n1-n2; i++ {
            v2 = append(v2, "0")
        }
    }


    // Compare
    for i := 0; i < len(v1); i++ {
        sv1, _ := strconv.Atoi(v1[i])
        sv2, _ := strconv.Atoi(v2[i])
        if sv1 < sv2 {
            return -1
        } else if sv1 > sv2 {
            return 1
        }
    }
    return 0

}
```