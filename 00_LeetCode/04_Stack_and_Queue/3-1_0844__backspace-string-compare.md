Question
=========

https://leetcode.com/problems/backspace-string-compare/description/

Given two strings s and t, return true if they are equal when both are typed into empty text editors. '#' means a backspace character.

Note that after backspacing an empty text, the text will continue empty.

 

Example 1:

Input: s = "ab#c", t = "ad#c"
Output: true
Explanation: Both s and t become "ac".
Example 2:

Input: s = "ab##", t = "c#d#"
Output: true
Explanation: Both s and t become "".
Example 3:

Input: s = "a#c", t = "b"
Output: false
Explanation: s becomes "c" while t becomes "b".
 

Constraints:

1 <= s.length, t.length <= 200
s and t only contain lowercase letters and '#' characters.



Hint
====

Slices in Go are not comparable, so a simple equality comparison a == b is not possible. To check if two slices are equal, write a custom function that compares their lengths and corresponding elements in a loop.

You can also use the reflect.DeepEqual() function that compares two values recursively, which means it traverses and checks the equality of the corresponding data values at each level. However, this solution is much slower and less safe than comparing values in a loop. 


Answer
======

python

```python
class Solution(object):
    def backspaceCompare(self, s, t):
        """
        :type s: str
        :type t: str
        :rtype: bool
        """
        stack1, stack2 = "", ""
        for char in s:
            if char == '#':
                try:
                    stack1 = stack1[:-1]
                except IndexError:
                    continue
            else:
                stack1 += char

        for char in t:
            if char == '#':
                try:
                    stack2 = stack2[:-1]
                except IndexError:
                    continue
            else:
                stack2 += char

        return stack1 == stack2
```


go

```go

func backspaceCompare(s string, t string) bool {
    stack1 := []byte{}
    stack2 := []byte{}
    for i := 0; i < len(s) ; i++ {
        if s[i] != '#' {
            stack1 = append(stack1, s[i])
        } else if len(stack1) > 0 {
            stack1 = stack1[:len(stack1)-1]
        }
    }

    for i := 0; i < len(t) ; i++ {
        if t[i] != '#' {
            stack2 = append(stack2, t[i])
        } else if len(stack2) > 0 {
            stack2 = stack2[:len(stack2)-1]
        }
    }

    if len(stack1) != len(stack2) {
        return false
    }

    for i := 0; i < len(stack1) ; i++ {
        if stack1[i] != stack2[i] {
            return false
        }
    }
    return true
}
```