Question
========

[](https://leetcode.com/problems/binary-tree-level-order-traversal/)

Given the root of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).


Example 1:
Input: root = [3,9,20,null,null,15,7]
Output: [[3],[9,20],[15,7]]

Example 2:
Input: root = [1]
Output: [[1]]

Example 3:
Input: root = []
Output: []
 

Constraints:

- The number of nodes in the tree is in the range [0, 2000].
- -1000 <= Node.val <= 1000



Hint
=====

BFS of Binary Tree 
----------------------------

Python

```python
def bfs(root):
    queue = deque([root])
    res = []
    while len(queue) > 0:
        cur_node = queue.popleft()
        res.append(cur_node.val)
        if cur_node.left is not None:
            queue.append(cur_node.left)

        if cur_node.right is not None:
            queue.append(cur_node.right)
    return res
```

Go

```go
func bfs(root *TreeNode) []int {
	res := []int{}
	queue := []*TreeNode{root}
	n := len(queue)
	for n > 0 {
		cur_node := queue[0]
		queue = queue[1:n]
		res = append(res, cur_node.Val)
		if cur_node.Left != nil {
			queue = append(queue, cur_node.Left)
		}
		if cur_node.Right != nil {
			queue = append(queue, cur_node.Right)
		}
		n = len(queue)
	}
	return res
}
```

Answer
======


This question is not just do BFS traversal, we need to group the values at the same level.

```python
# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
from collections import deque
class Solution:
    def levelOrder(self, root: Optional[TreeNode]) -> List[List[int]]:
        if not root:
            return []
        queue = deque([root])
        ans = []
        n = len(queue)
        while n > 0 :
            level_values = []
            for _ in range(n):
                current = queue.popleft()
                level_values.append(current.val)
                if current.left != None :
                    queue.append(current.left)
                if current.right != None:
                    queue.append(current.right)
            ans.append(level_values)
            n = len(queue)

        return ans
```

```go
/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func levelOrder(root *TreeNode) [][]int {
    res := [][]int{}
    if root == nil {
        return res
    }
    
	queue := []*TreeNode{root}
	n := len(queue)
	for n > 0 {
		level_values := []int{}
		for i := 0; i < n; i++ {
			cur_node := queue[0]
			if len(queue) > 0 {
				queue = queue[1:]
			}
			level_values = append(level_values, cur_node.Val)
			if cur_node.Left != nil {
				queue = append(queue, cur_node.Left)
			}
			if cur_node.Right != nil {
				queue = append(queue, cur_node.Right)
			}
		}
		res = append(res, level_values)
		n = len(queue)
	}
	return res
}
```