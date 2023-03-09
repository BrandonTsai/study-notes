

Question
=========

https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/

108. Convert Sorted Array to Binary Search Tree

Given an integer array nums where the elements are sorted in ascending order, convert it to a height-balanced binary search tree.

A height-balanced binary tree is a binary tree in which the depth of the two subtrees of every node never differs by more than one.


Example 1:
Input: nums = [-10,-3,0,5,9]
Output: [0,-3,9,-10,null,5]
Explanation: [0,-10,5,null,-3,null,9] is also accepted:

Example 2:
Input: nums = [1,3]
Output: [3,1]
Explanation: [1,null,3] and [3,1] are both height-balanced BSTs.


Constraints:

- 1 <= nums.length <= 104
- -104 <= nums[i] <= 104
- nums is sorted in a strictly increasing order.


Hint
===

A binary search tree is a binary tree in which every node fits a specific ordering property:
all_left_descendents <= n < all_right_descendents. This must be true for each node n.

My Answer
=========

For a sorted array, the left half will be in the left subtree, middle value as the root, right half in the right subtree. This holds true for every node:

[1, 2, 3, 4, 5, 6, 7] -> left: [1, 2, 3], root: 4, right: [5, 6, 7]
[1, 2, 3] -> left: [1], root: 2, right: [3]
[5, 6, 7] -> left: [5], root: 6, right: [7]


Python

```python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def sortedArrayToBST(self, nums: List[int]) -> Optional[TreeNode]:
        return self.convert(nums, 0, len(nums)-1)

    def convert(self, nums, left, right):
        if left > right:
            return None
        mid = (left + right) // 2
        node = TreeNode(nums[mid])
        node.left = self.convert(nums, left, mid - 1)
        node.right = self.convert(nums, mid + 1, right)
        return node
```


Go


```go
/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
import "fmt"
func Convert(nums *[]int, left int, right int) *TreeNode {
    if left > right {
        return nil
    }
    mid := (left + right) / 2
    node := TreeNode{}
    node.Val = (*nums)[mid]
    node.Left = Convert(nums, left, mid-1)
    node.Right = Convert(nums, mid+1, right)
    return &node
}

func sortedArrayToBST(nums []int) *TreeNode {
    return Convert(&nums, 0, len(nums)-1)
}
```