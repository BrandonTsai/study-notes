Question
========

https://leetcode.com/problems/permutations-ii/

Given a collection of numbers, nums, that might contain duplicates, return all possible unique permutations in any order.

Example 1:

```
Input: nums = [1,1,2]
Output:
[[1,1,2],
 [1,2,1],
 [2,1,1]]
```

Example 2:

```
Input: nums = [1,2,3]
Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
```

Constraints:

```
1 <= nums.length <= 8
-10 <= nums[i] <= 10
```

Answer
======

Similar to Permutation sultion,
But skip duplicated elements in the for loop.


```python
class Solution:
    def permuteUnique(self, nums: List[int]) -> List[List[int]]:
        res = []
        self.dfs(nums, [], res)
        return res

    def dfs(self, nums, choice, res):
        if not nums:
            res.append(choice[:])
            return

        for n in set(nums):
            newNums = nums.copy()
            newNums.remove(n)
            self.dfs(newNums, choice+[n], res)
```