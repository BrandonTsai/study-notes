Question
=========

Given an m x n matrix, return all elements of the matrix in spiral order.


Example 1:

```
Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
Output: [1,2,3,6,9,8,7,4,5]
```


Example 2:

```
Input: matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
Output: [1,2,3,4,8,12,11,10,9,5,6,7]
```

Constraints:

```
m == matrix.length
n == matrix[i].length
1 <= m, n <= 10
-100 <= matrix[i][j] <= 100
```




Answer
======

Approach 1: Set Up Boundaries
---------------

Intuition

Our goal is to update boundaries as follows: when we finish traversing a row or column, we want to set up a boundary on it so that next time we get there, we know we need to change the direction. Here is a demo for the first round of updating the top, right, bottom, and left boundaries.

Algorithm

1. Initialize the top, right, bottom, and left boundaries as up, right, down, and left.
1. Initialize the output array result.
1. Traverse the elements in spiral order and add each element to result:
    - Traverse from left boundary to right boundary.
    - Traverse from up boundary to down boundary.
    - Before we traverse from right to left, we need to make sure that we are not on a row that has already been traversed. If we are not, then we can traverse from right to left.
    - Similarly, before we traverse from top to bottom, we need to make sure that we are not on a column that has already been traversed. Then we can traverse from down to up.
    - Remember to move the boundaries by updating left, right, up, and down accordingly.
1. Return result.

```python
class Solution:
    def spiralOrder(self, matrix: List[List[int]]) -> List[int]:
        result = []
        rows, columns = len(matrix), len(matrix[0])
        up = left = 0
        right = columns - 1
        down = rows - 1

        while len(result) < rows * columns:
            # Traverse from left to right.
            for col in range(left, right + 1):
                result.append(matrix[up][col])

            # Traverse downwards.
            for row in range(up + 1, down + 1):
                result.append(matrix[row][right])

            # Make sure we are now on a different row.
            if up != down:
                # Traverse from right to left.
                for col in range(right - 1, left - 1, -1):
                    result.append(matrix[down][col])

            # Make sure we are now on a different column.
            if left != right:
                # Traverse upwards.
                for row in range(down - 1, up, -1):
                    result.append(matrix[row][left])

            left += 1
            right -= 1
            up += 1
            down -= 1

        return result
```
