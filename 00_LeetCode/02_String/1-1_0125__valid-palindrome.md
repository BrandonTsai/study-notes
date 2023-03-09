Questions
=========

https://leetcode.com/problems/valid-palindrome/

A phrase is a palindrome if, after **converting all uppercase letters into lowercase letters** and **removing all non-alphanumeric characters**, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

Given a string s, return true if it is a palindrome, or false otherwise.



Example 1:

```
Input: s = "A man, a plan, a canal: Panama"
Output: true
Explanation: "amanaplanacanalpanama" is a palindrome.
```


Example 2:

```
Input: s = "race a car"
Output: false
Explanation: "raceacar" is not a palindrome.
```

Example 3:


```
Input: s = " "
Output: true
Explanation: s is an empty string "" after removing non-alphanumeric characters.
Since an empty string reads the same forward and backward, it is a palindrome.
```

Constraints:

```
1 <= s.length <= 2 * 105
s consists only of printable ASCII characters.
```

Hint
====

### Converting string into lowercase/upper letters:


Python

```python
lowerStr = oldStr.lower()
upperStr = oldStr.upper()
```

Go

```go
import "strings"
lowerStr := strings.ToLower(oldStr)
upperStr := strings.ToUpper(oldStr)
```


### Removing all non-alphanumeric characters:


**Python**

We can use the `isalnum()` method to check whether a given character or string is alphanumeric or not. We can compare each character individually from a string, and if it is alphanumeric, then we combine it using the `join()` function.

```python
oldStr = "alphanumeric@123__"
newStr = ''.join(ch for ch in oldStr if ch.isalnum())
```

another way is using [`filter()`](https://docs.python.org/3/library/functions.html#filter) function to construct an iterator from components of the iterable object and filters the object’s elements using a function.

Note that filter(function, iterable) is equivalent to the generator expression (item for item in iterable if function(item))

For example,

```python
oldStr = "alphanumeric@123__"
newStr = ''.join(filter(str.isalnum, oldStr))
```


**Go**

Go does not have `isalnum` method, but we can use regular expression to remove all NonAlphanumeric characters in the string.

```go
package main

import (
	"fmt"
	"regexp"
)

func main() {
	oldStr := "alphanumericABCXYZ_-@123"
    nonAlphanumericRegex := regexp.MustCompile(`[^a-zA-Z0-9 ]+`)
	newStr := nonAlphanumericRegex.ReplaceAllString(oldStr, "")
	fmt.Println(newStr)
}
```

Answer
======

Approach 1: Reverse second half substring and compare with first half substring.
------------

First we remove all non-alphanumeric characters and conver string into lowercase letters.
Then we check the new string is Palindrome or not.

```python
class Solution:
    def isPalindrome(self, s: str) -> bool:
        newS = ''.join(filter(str.isalnum, s.lower()))

        med = len(newS) // 2
        secondHalf = newS[med:] if (len(newS)%2) == 0 else newS[med+1:]
        return newS[:med] == secondHalf[::-1]

```

Approach 2: Compare character one by one from forward and backward
------------

Python

```python
class Solution:
    def isPalindrome(self, s: str) -> bool:
        newS = ''.join(filter(str.isalnum, s.lower()))

        i, j = 0, len(newS)-1
        while i < j:
            if newS[i] == newS[j]:
                i += 1
                j -= 1
            else:
                return False

        return True
```

Go

```go
import (
    "strings"
    "regexp"
)

func isPalindrome(s string) bool {
    nonAlphanumericRegex := regexp.MustCompile(`[^a-z0-9]+`)
    newS := nonAlphanumericRegex.ReplaceAllString(strings.ToLower(s), "")

    i := 0
    j := len(newS)-1
    for i < j {
        if newS[i] == newS[j] {
            i++
            j--
        } else {
            return false
        }
    }
    return true
}
```