Question
=======

https://leetcode.com/problems/valid-parentheses/

Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

An input string is valid if:

Open brackets must be closed by the same type of brackets.
Open brackets must be closed in the correct order.


Example 1:

```
Input: s = "()"
Output: true
```

Example 2:

```
Input: s = "()[]{}"
Output: true
```

Example 3:

```
Input: s = "(]"
Output: false
```

Constraints:

```
1 <= s.length <= 104
s consists of parentheses only '()[]{}'.
```

Answer
=======

Using Stack.

Do stack.push() when we meed `[`, `{` and `(`
DO stack.pop() when we meed `]`, `}` and `)`
Make sure the elements we pop from the stack is the mapping character.

```python
class Solution:
    def isValid(self, s: str) -> bool:

        stack = []
        mapping = {")": "(", "}": "{", "]": "["}

        for char in s:
            if char in mapping :
                top_element = stack.pop() if stack else '#'
                if mapping[char] != top_element:
                    return False
            else:
                stack.append(char)
        return not stack

```

Go

```go

func isValid(s string) bool {
    stack := []byte{}
    mapping := map[byte]byte{
        ')':'(' , 
        ']':'[' , 
        '}':'{',
    }
    for i := 0; i < len(s); i++ {
        val, exist := mapping[s[i]]
        if exist {
            if len(stack) > 0 {
                top_element := stack[len(stack)-1]
            } else {
                return false
            }
            if val != top_element {
                return false
            }
            // Pop the top element
            stack = stack[:len(stack)-1]
        } else {
            stack = append(stack, s[i])
        }
    }
    if len(stack) > 0 {
        return false
    }
    return true
}
```