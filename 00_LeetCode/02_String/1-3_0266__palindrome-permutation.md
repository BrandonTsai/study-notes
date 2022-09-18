Question
========

https://leetcode.com/problems/palindrome-permutation/

Given a string s, return true if a permutation of the string could form a palindrome.

Example 1:

```
Input: s = "code"
Output: false
```

Example 2:

```
Input: s = "aab"
Output: true
```

Example 3:

```
Input: s = "carerac"
Output: true
```

Constraints:

```
1 <= s.length <= 5000
s consists of only lowercase English letters.
```

Answer
=======


Approach 1: Count the number of each character.
--------------

we traverse over the \text{map}map created and find the number of characters with odd number of occurrences. If this \text{count}count happens to exceed 1 at any step, we conclude that a palindromic permutation isn't possible for the string ss. But, if we can reach the end of the string with \text{count}count lesser than 2, we conclude that a palindromic permutation is possible for ss.

```python
from collections import Counter
class Solution:
    def canPermutePalindrome(self, s: str) -> bool:
        oddCharacter = 0
        cCount = Counter(s)
        for c in cCount.values():
            if c % 2 != 0:
                oddCharacter += 1
        return oddCharacter < 2
```

Approach 2: BackTrack/DFS
------
Step 1, find all permutation of the string.
step 2, the the permutation is palindrome, add to result

> Time Limit Exceeded!!


