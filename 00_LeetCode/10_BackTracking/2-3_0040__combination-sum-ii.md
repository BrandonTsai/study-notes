Question
=======

https://leetcode.com/problems/combination-sum-ii/


Given a collection of candidate numbers (candidates) and a target number (target), find all unique combinations in candidates where the candidate numbers sum to target.

**Each number in candidates may only be used once** in the combination.

Note: The solution set must not contain duplicate combinations.



Example 1:

```
Input: candidates = [10,1,2,7,6,1,5], target = 8
Output:
[
[1,1,6],
[1,2,5],
[1,7],
[2,6]
]
```

Example 2:

```
Input: candidates = [2,5,2,1,2], target = 5
Output:
[
[1,2,2],
[5]
]
```

Constraints:

```
1 <= candidates.length <= 100
1 <= candidates[i] <= 50
1 <= target <= 30
```

Answer
======

Notice that in this queestion, candidate numbers is not distinct integers


Approch 1:  Using Set.
```python

class Solution:
    def combinationSum2(self, candidates: List[int], target: int) -> List[List[int]]:
        res = []
        choice = []
        candidates.sort()
        self.dfs(candidates, target, choice, res)
        return res

    def dfs(self, candidates, target, choice=[], res=[]):
        if target == 0:
            res.append(choice[:])
            return res
        elif target < 0:
            return res

        candSet = set(candidates)
        for n in candSet:
            i = candidates.index(n)
            choice.append(n)
            self.dfs(candidates[i+1:], target-n, choice, res)
            choice.remove(n)

```

```python

Approch 2:  Compare with previous value.
class Solution:
    def combinationSum2(self, candidates: List[int], target: int) -> List[List[int]]:
        res = []
        candidates.sort()
        def dfs(idx, path, cur):
            if cur > target: return
            if cur == target:
                res.append(path)
                return
            for i in range(idx, len(candidates)):
                if i > idx and candidates[i] == candidates[i-1]:
                    continue
                dfs(i+1, path+[candidates[i]], cur+candidates[i])
        dfs(0, [], 0)
        return res
```