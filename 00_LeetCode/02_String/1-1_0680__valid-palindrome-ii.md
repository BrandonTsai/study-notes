Question
=========

https://leetcode.com/problems/valid-palindrome-ii/

Given a string s, return true if the s can be palindrome after deleting at most one character from it.



Example 1:

```
Input: s = "aba"
Output: true
```


Example 2:

```
Input: s = "abca"
Output: true
Explanation: You could delete the character 'c'.
```

Example 3:

```
Input: s = "abc"
Output: false
```

Constraints:

```
1 <= s.length <= 105
s consists of lowercase English letters.
```

Answer
======

Use two pointers to compare the character one by one from forward and backward.
if it is not equal, then skip the character once and check the rest is palindrome or not.


```python3
class Solution:
    def validPalindrome(self, s: str) -> bool:

        i, j = 0, len(s) - 1

        while i < j:
            if s[i] == s[j]:
                i += 1
                j -= 1
            else:
                return self.validPalindromeUtil(s, i + 1, j) or self.validPalindromeUtil(s, i, j - 1)
        return True

    def validPalindromeUtil(self, s, i, j):
        while i < j:
            if s[i] == s[j]:
                i += 1
                j -= 1
            else:
                return False

        return True
```