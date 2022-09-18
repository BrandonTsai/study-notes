Question
========

https://leetcode.com/problems/insert-interval/

You are given an array of **non-overlapping** intervals where intervals[i] = [starti, endi] represent the start and the end of the ith interval and intervals is **sorted** in ascending order by starti. You are also given an interval newInterval = [start, end] that represents the start and end of another interval.

Insert newInterval into intervals such that intervals is still sorted in ascending order by starti and intervals still does not have any overlapping intervals (merge overlapping intervals if necessary).

Return intervals after the insertion.



Example 1:

```
Input: intervals = [[1,3],[6,9]], newInterval = [2,5]
Output: [[1,5],[6,9]]
```


Example 2:

```
Input: intervals = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval = [4,8]
Output: [[1,2],[3,10],[12,16]]
Explanation: Because the new interval [4,8] overlaps with [3,5],[6,7],[8,10].
```

Constraints:

```
0 <= intervals.length <= 104
intervals[i].length == 2
0 <= starti <= endi <= 105
intervals is sorted by starti in ascending order.
newInterval.length == 2
0 <= start <= end <= 105
```

Hint
====

### Python


https://docs.python.org/3/library/bisect.html

The `bisec` - Array bisection algorithm provides support for maintaining a list in sorted order without having to sort the list after each insertion.

The `insort(a, x, lo=0, hi=len(a), *, key=None)` inserting x in a after any existing entries of x. This function are O(n) because the logarithmic search step is dominated by the linear time insertion step.


### Go

Go do not have buildin `bisec` module. However, we can use [`sort.Search(n int, f func(int) bool)`](https://pkg.go.dev/sort#Search) to find the first index for which the function returns true, and then insert a new element to the index of a slice.
Following is the method to insert a value in a slice at a given index

```go
func insert(a []int, index int, value int) []int {
    if len(a) == index { // nil or empty slice or after last element
        return append(a, value)
    }
    a = append(a[:index+1], a[index:]...) // index < len(a)
    a[index] = value
    return a
}
```

Answer
=====

Insert new intervals to right order
and then run the Algorithm for merge intervals.


Approach 1: sort array with custom lambda function
---------

Python

```python
class Solution:
    def insert(self, intervals: List[List[int]], newInterval: List[int]) -> List[List[int]]:
        intervals.append(newInterval)
        intervals.sort(key=lambda x: x[0])
        merged = []
        for interval in intervals:
            if not merged or merged[-1][1] < interval[0]:
                # if the list of merged intervals is empty or if the current
                # interval does not overlap with the previous, simply append it.
                merged.append(interval)
            else:
                # otherwise, there is overlap, so we merge the current and previous
                # intervals.
                merged[-1][1] = max(merged[-1][1], interval[1])
        return merged
```



Approach 2: Using bisect.insort() function
----------

Python

```python
from bisect import insort
class Solution:
    def insert(self, intervals: List[List[int]], newInterval: List[int]) -> List[List[int]]:
        insort(intervals,newInterval)
        merged = []
        for interval in intervals:
            if not merged or merged[-1][1] < interval[0]:
                # if the list of merged intervals is empty or if the current
                # interval does not overlap with the previous, simply append it.
                merged.append(interval)
            else:
                # otherwise, there is overlap, so we merge the current and previous
                # intervals.
                merged[-1][1] = max(merged[-1][1], interval[1])
        return merged
```


Go

```go
import (
    "fmt"
    "math"
)

func insortInterval(a [][]int, index int, value []int) [][]int {
    if len(a) == index { // nil or empty slice or after last element
        return append(a, value)
    }
    a = append(a[:index+1], a[index:]...) // index < len(a)
    a[index] = value
    return a
}

func insert(intervals [][]int, newInterval []int) [][]int {
    i := sort.Search(len(intervals), func(i int) bool { return intervals[i][0] >= newInterval[0] })
    intervals = insortInterval(intervals, i, newInterval)
    merged := [][]int{}
    for _, interval := range intervals {
        n := len(merged)
        if n == 0 || merged[n-1][1] < interval[0] {
            merged = append(merged, interval)
        } else {
            merged[n-1][1] = int(math.Max(float64(merged[n-1][1]), float64(interval[1])))
        }
    }
    return merged
}

```