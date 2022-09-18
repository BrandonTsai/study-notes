Question
=========

https://leetcode.com/problems/non-overlapping-intervals/


Given an array of intervals intervals where intervals[i] = [starti, endi], return the minimum number of intervals you need to remove to make the rest of the intervals non-overlapping.


Example 1:

```
Input: intervals = [[1,2],[2,3],[3,4],[1,3]]
Output: 1
Explanation: [1,3] can be removed and the rest of the intervals are non-overlapping.
```


Example 2:

```
Input: intervals = [[1,2],[1,2],[1,2]]
Output: 2
Explanation: You need to remove two [1,2] to make the rest of the intervals non-overlapping.
```

Example 3:

```
Input: intervals = [[1,2],[2,3]]
Output: 0
Explanation: You don't need to remove any of the intervals since they're already non-overlapping.
```

Constraints:

```
1 <= intervals.length <= 105
intervals[i].length == 2
-5 * 104 <= starti < endi <= 5 * 104
```


Answer
=====

Greedy Alg: Always drop the overlap interval with the earliest end time.

For this, firstly we sort the given intervals based on the **end** points. Then, we traverse over the sorted intervals. While traversing, if there is no overlapping between the previous interval and the current interval, we need not remove any interval. But, if an overlap exists between the previous interval and the current interval, we always drop the current interval.

intervals = [[1,2],[2,3],[3,4],[1,3]]
sortedByEndPoint = [[1,2],[2,3],[1,3],[3,4]]

```python
class Solution:
    def eraseOverlapIntervals(self, intervals: List[List[int]]) -> int:
        intervals.sort(key=lambda x: x[1])
        pre = []
        removeCount = 0
        for interval in intervals:
            if not pre or pre[1] <= interval[0]:
                pre = interval
            else:
                removeCount += 1
        return removeCount
```