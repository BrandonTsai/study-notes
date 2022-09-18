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

Converting string into lowercase/upper letters: 

- `newString = string.lower()`
- `newString = string.upper()`

Removing all non-alphanumeric characters: 
We can use the `isalnum()` method to check whether a given character or string is alphanumeric or not. We can compare each character individually from a string, and if it is alphanumeric, then we combine it using the `join()` function.

```python
string_value = "alphanumeric@123__"
s = ''.join(ch for ch in string_value if ch.isalnum())
print(s)
```

another way is using `filter()` function to construct an iterator from components of the iterable object and filters the object’s elements using a function.


For example,

```python
string_value = "alphanumeric@123__"
s = ''.join(filter(str.isalnum, string_value))
print(s)
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