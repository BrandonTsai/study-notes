Question
========

https://leetcode.com/problems/palindrome-permutation-ii/

Given a string s, return all the palindromic permutations (without duplicates) of it.

You may return the answer in any order. If s has no palindromic permutation, return an empty list.

 

Example 1:

```
Input: s = "aabb"
Output: ["abba","baab"]
```

Example 2:

```
Input: s = "abc"
Output: []
```

Constraints:

```
1 <= s.length <= 16
s consists of only lowercase English letters.
```

Answer
=======

Approach 1: build string from the middle
-----------

We can construct palindromes by considering two scenarios, either there is one character that has an odd count, or all characters have even counts.

If all characters have even counts, the process of backtracking is simple. For each remaining character, we simply add it to each side of the current solution. One branch of the backtracking solution would grow like this:

```
initial counter: {'a' : 2, 'b' : 2, 'c' : 2}

choice: '', remaining: {'a' : 2, 'b' : 2, 'c' : 2}
choice: 'aa', remaining: {'b' : 2, 'c' : 2}
choice: 'baab', remaining: {'c' : 2}
choice: 'cbaabc', remaining: {} # no more characters, add cur to result and backtrack
```

If one character has an odd count, we start with the odd-count character as choice and repeat the same process. It would look something like this:

````
initial counter: {'a' : 2, 'b' : 2, 'c' : 2, 'i' : 1}

choice: 'i', remaining: {'a' : 2, 'b' : 2, 'c' : 2}
choice: 'aia', remaining: {'b' : 2, 'c' : 2}
choice: 'baiab', remaining: {'c' : 2}
choice: 'cbaiabc', remaining: {} # no more characters, add cur to result and backtrack
```

```python
from collections import Counter
class Solution:
    def generatePalindromes(self, s: str) -> List[str]:
        counter = Counter(s)
        res = []
        oddCounts = [c for c in counter if counter[c]%2] 
        if len(oddCounts) == 0:
            self.backtrack(counter, '', res)
        elif len(oddCounts) == 1:
            middle = oddCounts[0]
            counter[middle] -= 1
            if not counter[middle]:
                del counter[middle]
            self.backtrack(counter, middle, res)
        return res

    def backtrack(self, counter, choice, res):
        if not counter:
            res.append(choice)
            return
        for c in list(counter.keys()):
            counter[c] -= 2
            if not counter[c]:
                del counter[c]
            self.backtrack(counter, c+choice+c, res)
            counter[c] += 2
```