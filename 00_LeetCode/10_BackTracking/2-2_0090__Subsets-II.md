Question
=======

https://leetcode.com/problems/subsets-ii/


Given an integer array nums that may contain duplicates, return all possible subsets (the power set).
The solution set must not contain duplicate subsets. Return the solution in any order.

Example 1:

```
Input: nums = [1,2,2]
Output: [[],[1],[1,2],[1,2,2],[2],[2,2]]
```

Example 2:

```
Input: nums = [0]
Output: [[],[0]]
```

Constraints:

```
1 <= nums.length <= 10
-10 <= nums[i] <= 10
```


Answer
======


```python
class Solution:
    def subsetsWithDup(self, nums: List[int]) -> List[List[int]]:
        nums.sort()
        res = []
        self.dfs(nums, [], res)
        return res

    def dfs(self, nums, choice=[], res=[]):
        res.append(choice)
        if not nums:
            return
        pre = None
        for i in range(len(nums)):
            if nums[i] != pre:
                pre = nums[i]
                self.dfs(nums[i+1:],choice + [nums[i]], res)
```

Runtime: 45 ms, faster than 81.95% of Python3 online submissions for Subsets II.
Memory Usage: 14 MB, less than 99.56% of Python3 online submissions for Subsets II.