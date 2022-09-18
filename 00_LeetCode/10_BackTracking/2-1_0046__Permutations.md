Question
========

https://leetcode.com/problems/permutations/

Given an array nums of distinct integers, return all the possible permutations. You can return the answer in any order.

Example 1:

```
Input: nums = [1,2,3]
Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
```

Example 2:

```
Input: nums = [0,1]
Output: [[0,1],[1,0]]
```

Example 3:

```
Input: nums = [1]
Output: [[1]]
```

Constraints:

```
1 <= nums.length <= 6
-10 <= nums[i] <= 10
All the integers of nums are unique.
```


Answers
======



Solution 1: DFS

This solution is short and concise for sure. However, I would not recommend it when you are practicing(you could do you that during interview though). The reason being that it is very expensive to do "nums[:i]+nums[i+1:]" or "choice+[nums[i]]" during each recursion. It is gonna create a new list/memory every time you do "+" operation on two lists, which is very expensive. Instead, a more efficient way is to do backtracking by doing "choice.pop()"



```python
# DFS
class Solution:
    def permute(self, nums):
        res = []
        self.dfs(nums, [], res)
        return res

    def dfs(self, nums, choice, res):
        if not nums:
            res.append(choice[:])
            # return # backtracking
        for i in range(len(nums)):
            self.dfs(nums[:i]+nums[i+1:], choice+[nums[i]], res)

```

Runtime: 45 ms, faster than 87.52% of Python3 online submissions for Permutations.
Memory Usage: 14.1 MB, less than 58.61% of Python3 online submissions for Permutations.




Solution 2: Use stack to save memory?


```python
from collections import deque

class Solution:
    def permute(self, nums):
        res = []
        choice = deque()
        self.dfs(nums, choice, res)
        return res

    def dfs(self, nums, choice, res):
        if not nums:
            res.append(list(choice))
            # return # backtracking
        for i in range(len(nums)):
            choice.append(nums[i])
            self.dfs(nums[:i]+nums[i+1:], choice, res)
            choice.pop()

```

Runtime: 67 ms, faster than 41.93% of Python3 online submissions for Permutations.
Memory Usage: 13.9 MB, less than 84.46% of Python3 online submissions for Permutations.