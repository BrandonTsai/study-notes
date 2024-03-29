Question
======

https://leetcode.com/problems/product-of-array-except-self/

Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].

The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

You must write an algorithm that runs in **O(n) time** and **without using the division operation.**



Example 1:

```
Input: nums = [1,2,3,4]
Output: [24,12,8,6]
```


Example 2:

```
Input: nums = [-1,1,0,-3,3]
Output: [0,0,9,0,0]
```

Constraints:

```
2 <= nums.length <= 105
-30 <= nums[i] <= 30
The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
```

> Follow up: Can you solve the problem in O(1) extra space complexity? (The output array does not count as extra space for space complexity analysis.)


Hint
====

How to initial list with fixed lengh and initial value.

Python

```python
a = [1] * 5 # a = [1, 1, 1, 1, 1]
```

Go can not initial array with fixed length and initial value.
You can use `make` function to initial an array with fixed length, which initial value is 0
Then initial value with for loop.

```go

func main() {
	n := 10
	ans := make([]int, n)
	for i := range ans {
		ans[i] = 1
	}
	fmt.Println(ans)
}

```


Answer
=====

Approach 1: Divid to Left and Right product list
---------


![](https://leetcode.com/problems/product-of-array-except-self/Figures/238/diag-1.png)

```python
class Solution:
    def productExceptSelf(self, nums: List[int]) -> List[int]:
        l = len(nums)
        left = [1] * l
        right = [1] * l

        for i in range(l-1):
            left[i+1] = left[i]*nums[i]

        for i in range(l-2, -1, -1):
            right[i] = right[i+1] * nums[i+1]

        for i in range(l):
            left[i] = left[i] * right[i]

        return left
```

Approach 2: Replace right array with one variable
-----

To solve the follow up question, we can replace the right array with single variable

```python
class Solution:
    def productExceptSelf(self, nums: List[int]) -> List[int]:
        n = len(nums)
        left = [1] * n
        right = 1

        for i in range(n-1):
            left[i+1] = left[i]*nums[i]

        for i in range(n-2, -1, -1):
            right = right * nums[i+1]
            left[i] = left[i] * right

        return left
```

Go

```go
func productExceptSelf(nums []int) []int {
    n := len(nums)
    left := make([]int, n)
    right := 1

    left[0] = 1
    for i := 0 ; i < n-1 ; i++ {
        left[i+1] = left[i]*nums[i]
    }

    for i := n-2 ; i > -1 ; i-- {
        right = right * nums[i+1]
        left[i] = left[i] * right
    }

    return left
}

```


