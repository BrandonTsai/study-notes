
Question
=======

https://leetcode.com/problems/combination-sum/

Given an array of **distinct integers** candidates and a target integer target, return a list of all **unique** combinations of candidates where the chosen numbers sum to target. You may return the combinations in any order.

**The same number may be chosen from candidates an unlimited number of times.** Two combinations are unique if the frequency of at least one of the chosen numbers is different.

It is guaranteed that the number of unique combinations that sum up to target is less than 150 combinations for the given input.



Example 1:

```
Input: candidates = [2,3,6,7], target = 7
Output: [[2,2,3],[7]]
Explanation:
2 and 3 are candidates, and 2 + 2 + 3 = 7. Note that 2 can be used multiple times.
7 is a candidate, and 7 = 7.
These are the only two combinations.
```

Example 2:

```
Input: candidates = [2,3,5], target = 8
Output: [[2,2,2,2],[2,3,3],[3,5]]
```

Example 3:

```
Input: candidates = [2], target = 1
Output: []
```

Constraints:

```
1 <= candidates.length <= 30
1 <= candidates[i] <= 200
All elements of candidates are distinct.
1 <= target <= 500
```


Answer
======


```python
class Solution:
    def combinationSum(self, candidates: List[int], target: int) -> List[List[int]]:
        res = []
        self.dfs([], candidates, target, res)
        return res


    def dfs(self, choice, opts, remain, res):
            if remain == 0:
                # make a deep copy of the current combination
                res.append(list(choice))
                return
            elif remain < 0:
                # exceed the scope, stop exploration.
                return

            for i in range(len(opts)):
                self.dfs(choice + [opts[i]], opts[i:], remain-opts[i], res)

```

Runtime: 169 ms, faster than 28.29% of Python3 online submissions for Combination Sum.
Memory Usage: 14.1 MB, less than 72.82% of Python3 online submissions for Combination Sum.