
Question
=======

https://leetcode.com/problems/longest-substring-without-repeating-characters/


Given a string s, find the length of the longest substring without repeating characters.


Example 1:
```
Input: s = "abcabcbb"
Output: 3
Explanation: The answer is "abc", with the length of 3.
```

Example 2:
```
Input: s = "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.
```

Example 3:

```
Input: s = "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3.
Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
```

Constraints:

```
0 <= s.length <= 5 * 104
s consists of English letters, digits, symbols and spaces.
```

Hint
====

### How to check an element is in a hashmap's keys

Python


```python
if key1 in hashmap:
  // do sothing
```

Go

```go
// If a key doesn't exist in the map, we get the zero value of the value type
fmt.Println("Salad's price is", m["Salad"])

// Appropriate way to check key exist or not
price, priceExist := m["Salad"]
if priceExist {
    fmt.Println("Salad's price is", price)
} else {
    fmt.Println("This store does not sell Salad")
}
```


### Go do not have 'Char' type

Golang doesn’t have a `char` data type. It uses `byte/uint8` and `rune/int32` to represent character values. 


```go
helloStr := "Hello World!"

fmt.Printf("type of helloStr[0] is %T\n", helloStr[0])
// type of helloStr[0] is uint8
```


Solution
=========

Approach: Two pointer
---------------------


![](0003.png)

Python

```python

class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        hashmap = {}
        ans, left = 0, 0
        for right in range(len(s)):
            """
            We need to cange the left pointer only when there is duplicate element and the previous duplcated element was in current substring.
            """
            if s[right] in hashmap and hashmap[s[right]] >= left:
                left = hashmap[s[right]] + 1
            else:
                ans = max(ans, right - left + 1)
            hashmap[s[right]] = right
        return ans
```


Go

```go
import "math"
func lengthOfLongestSubstring(s string) int {
    hashmap := map[byte]int{}
    ans := 0
    left := 0
    for right := 0; right < len(s) ; right++ {
        repeatCharIndex, repeatCharExist := hashmap[s[right]]
        if repeatCharExist && repeatCharIndex >= left {
            left = repeatCharIndex + 1
        } else {
            ans = int(math.Max(float64(ans), float64(right - left + 1)))
        }
        hashmap[s[right]] = right   
    }
    return ans  
}
```