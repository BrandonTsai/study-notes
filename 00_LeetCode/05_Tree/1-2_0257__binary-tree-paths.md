Question
========

https://leetcode.com/problems/binary-tree-paths/description/


iven the root of a binary tree, return all root-to-leaf paths in any order.

A leaf is a node with no children.

Example 1:
Input: root = [1,2,3,null,5]
Output: ["1->2->5","1->3"]

Example 2:
Input: root = [1]
Output: ["1"]


Constraints:

- The number of nodes in the tree is in the range [1, 100].
- -100 <= Node.val <= 100


Hint
=====

DFS of Binary Tree 
----------------------------

We can implement recursition solution which is same as preOrder,Inorder,PostOrder traversal solution
Or we can achieve our goal via "Stack".


Python

```python
def dfs(root):
    if not root:
        return []
    stack = [root]
    res = []
    while len(stack) > 0:
        cur_node = stack.pop()
        res.append(cur_node.val)
        if cur_node.right is not None:
            stack.append(cur_node.right)
        if cur_node.left is not None:
            stack.append(cur_node.left)
    return res
```


Answer
=======

Python

```python

# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def binaryTreePaths(self, root: Optional[TreeNode]) -> List[str]:
        stack = [(root, "%d" % root.val)]
        ans = []
        while len(stack) > 0:
            node, path = stack.pop()
            if node.left == None and node.right == None:
                ans.append(path)
                continue

            if node.right:
                stack.append((node.right, path + "->" + str(node.right.val)))

            if node.left:
                stack.append((node.left, path + "->" + str(node.left.val)))
        return ans
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
import "strconv"
func binaryTreePaths(root *TreeNode) []string {
    res := []string{}
	stackNode := []*TreeNode{root}
    stackPath := []string{strconv.Itoa(root.Val)}
	n := len(stackNode)
	for n > 0 {
		node := stackNode[n-1]
        path := stackPath[n-1]
		stackNode = stackNode[0 : n-1]
        stackPath = stackPath[0 : n-1]
        if node.Left == nil && node.Right == nil {
            res = append(res, path)
        }
		
		if node.Left != nil {
			stackNode = append(stackNode, node.Left)
            stackPath = append(stackPath, path + "->" + strconv.Itoa(node.Left.Val))
		}
		if node.Right != nil {
			stackNode = append(stackNode, node.Right)
            stackPath = append(stackPath, path + "->" + strconv.Itoa(node.Right.Val))
		}
		n = len(stackNode)
	}
	return res
}
```