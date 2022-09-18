Question
========

https://leetcode.com/problems/merge-intervals/

Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.


Example 1:

```
Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
Output: [[1,6],[8,10],[15,18]]
Explanation: Since intervals [1,3] and [2,6] overlap, merge them into [1,6].
```


Example 2:

```
Input: intervals = [[1,4],[4,5]]
Output: [[1,5]]
Explanation: Intervals [1,4] and [4,5] are considered overlapping.
```

Constraints:

```
1 <= intervals.length <= 104
intervals[i].length == 2
0 <= starti <= endi <= 104
```

Hint:
====


Python
-------

sort an array with custom function

```python
def myFun(n):
  return abs(n)

list1 = [2, -4, 0, -1, 3, 9]
list1.sort(key=myFun)
print(list1)    # [0, -1, 2, 3, -4, 9]

list2 = [("Brandon", 100), ("Lia", 85), ("John", 60)]
list2.sort(key=lambda x: x[1])
print(list2)    # [('John', 60), ('Lia', 85), ('Brandon', 100)]
```

Get the max/min value between two value or an List

```python
>>> max(3, 6)
6
>>> min(3, 6)
3
>>> max([1, 3, -2])
3
>>> min([1, 3, -2])
-2
```

Go
----

Sort an slice with custom function
`Slice()` and `SliceStable()` that accept a comparator function as an argument:

| Function      | Feaure                                                    |
| ------------- | --------------------------------------------------------- |
| Slice()       | equal elements may be reversed from their original order. |
| SliceStable() | keeping equal elements in their original order.           |

```go
package main

import (
	"fmt"
	"sort"
)

func main() {
	// Sorting a slice of strings by length
	fruits := []string{"Apple", "Mongo", "Pineapple"}
	sort.SliceStable(fruits, func(i, j int) bool {
		return len(fruits[i]) < len(fruits[j])
	})
	fmt.Println("Sorted strings by length: ", strs)
}
```


Go does not have negative indexing like Python does.
Use the index *len(a)-1* to access the last element of a slice or array.

Get the max/min value between two value using the `func Max(x, y float64) float64` and `func Min(x, y float64) float64` function in math package.
Notice that they can only compare two "Float64" type variables, Int type variables are not accepted. They CAN NOT find out the max/min value in a slice as well.

```go

package main

import (
	"fmt"
	"math"
)

func main() {
	a := 5
	b := 3
	c := math.Max(float64(a), float64(b))
	fmt.Println(c)
}

```

Answer
=====

If we sort the intervals by their start value, then each set of intervals that can be merged will appear as a contiguous "run" in the sorted list.

```python
class Solution:
    def merge(self, intervals: List[List[int]]) -> List[List[int]]:

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

```go
import (
    "fmt"
    "sort"
    "math"
)

func merge(intervals [][]int) [][]int {
    sort.SliceStable(intervals, func(i, j int) bool {
		return intervals[i][0] < intervals[j][0]
	})
    //fmt.Println(intervals)
    
    merged := [][]int{}
    for _, interval := range intervals {
        //fmt.Println(interval)
        l := len(merged)
        if l == 0 || merged[l-1][1] < interval[0] {
            merged = append(merged, interval)
        } else {
            merged[l-1][1] = int(math.Max(float64(merged[l-1][1]), float64(interval[1])))
        }
    }
    return merged
}
```