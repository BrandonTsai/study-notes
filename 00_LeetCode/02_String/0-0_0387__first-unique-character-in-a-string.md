

Question
=========

https://leetcode.com/problems/first-unique-character-in-a-string





Hint
=====

Python's Counter
--------------

https://realpython.com/python-counter/

Counter internally iterates through the input sequence, counts the number of times a given object occurs, and stores objects as keys and the counts as values. In Counter, a highly optimized C function provides the counting functionality.

```python
>>> from collections import Counter

>>> # Use a string as an argument
>>> Counter("mississippi")
Counter({'i': 4, 's': 4, 'p': 2, 'm': 1})
```

Answer
=======



Python

```python
from collections import Counter
class Solution:
    def firstUniqChar(self, s: str) -> int:
        count = Counter(s)
        indexes = [s.index(letter) for letter in count if count[letter] == 1]
        return min(indexes) if indexes else -1
```

Go do not have Counter module likee python.
We have to count it via HashMap.

```go
func firstUniqChar(s string) int {
    count := map[rune]int{}

	for _, letter := range s {
		count[letter]++
	}

	for index, letter := range s {
		if count[letter] == 1 {
			return index
		}
	}

	return -1
}
```