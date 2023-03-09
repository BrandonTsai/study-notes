Question
=======

https://leetcode.com/problems/move-zeroes/

Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.

Note: **that you must do this in-place without making a copy of the array.**



Example 1:

```
Input: nums = [0,1,0,3,12]
Output: [1,3,12,0,0]
```


Example 2:

```
Input: nums = [0]
Output: [0]
```

Constraints:

```
1 <= nums.length <= 104
-231 <= nums[i] <= 231 - 1
```


Hint
====

Swap two variables in python

```python
a, b = b, a
```

Swap two variables in Go

```go
a, b = b, a
```

Answer
======


### Two pointers (Optimal)

Use one point (slow) to point out the position should be placed when a non-zerp element found in the for loop.

- All elements before the *slow* pointer are non-zeroes.
- All elements between the current pointer and the *slow* pointer are zeroes.

Therefore, when we encounter a non-zero element, we need to swap elements pointed by current and slow pointer, then advance both pointers. If it's zero element, we just advance current pointer.

With this invariant in-place, it's easy to see that the algorithm will work.


Python

```python
class Solution:
    def moveZeroes(self, nums: List[int]) -> None:
        slow = 0
        for current in range(len(nums)):
            if nums[current] != 0:
                nums[slow], nums[current] = nums[current], nums[slow]
                slow += 1
```


Go

```go
func moveZeroes(nums []int)  {
    slow := 0
    for current := range nums {
        if nums[current] != 0 {
            nums[slow], nums[current] = nums[current], nums[slow]
            slow += 1
        }
    }
}
```