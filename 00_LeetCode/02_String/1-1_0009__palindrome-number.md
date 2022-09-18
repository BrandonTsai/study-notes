

Questions
======

https://leetcode.com/problems/palindrome-number/

Given an integer x, return true if x is palindrome integer.
An integer is a palindrome when it reads the same backward as forward.
For example, 121 is a palindrome while 123 is not.


Example 1:

```
Input: x = 121
Output: true
Explanation: 121 reads as 121 from left to right and from right to left.
```

Example 2:

```
Input: x = -121
Output: false
Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
```

Example 3:

```
Input: x = 10
Output: false
Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
```

Constraints:

```
-231 <= x <= 231 - 1
```

Answer
======



Approach 1: Reverting the list, and then compare the list with original list.
--------

We can convert it to string, and compare the reversed string is same as the original string or not.


> Learn how to reverse a string or a list.

```python
def isPalindrome(self, x: int) -> bool:
	if x < 0:
		return False
	return str(x) == str(x)[::-1]
```


Approach 2: campare with half of the reverse integer
-------

I'd recommend you to solve leetcode question 7 (reverse integer) to understand the logic behind this solution.

Python3 int type has no lower or upper bounds. But if there are constraints given then we have to make sure that while reversing the integer we don't cross those constraints.

So, instead of reversing the whole integer, let's convert half of the integer and then check if it's palindrome.
But we don't know when is that half going to come.

Example, if x = 15951, then let's create reverse of x in loop. Initially, x = 15951, revX = 0

x = 1595, revX = 1
x = 159, revX = 15
x = 15, revX = 159
We see that revX > x after 3 loops and we crossed the half way in the integer bcoz it's an odd length integer.
If it's an even length integer, our loop stops exactly in the middle.

Now we can compare x and revX, if even length, or x and revX//10 if odd length and return True if they match.




```python
def isPalindrome(self, x: int) -> bool:
	if x < 0 or (x > 0 and x%10 == 0):   # if x is negative, return False. if x is positive and last digit is 0, that also cannot form a palindrome, return False.
		return False

	result = 0
	while x > result:
		result = result * 10 + x % 10
		x = x // 10

	return True if (x == result or x == result // 10) else False
```


>> Hint: 5 / 2 will return 2.5 and 5 // 2 will return 2