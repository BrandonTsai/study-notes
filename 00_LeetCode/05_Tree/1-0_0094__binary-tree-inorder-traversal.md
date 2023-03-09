
Question
========

https://leetcode.com/problems/binary-tree-inorder-traversal/


Given the root of a binary tree, return the inorder traversal of its nodes' values.


Example 1:
Input: root = [1,null,2,3]
Output: [1,3,2]

Example 2:
Input: root = []
Output: []

Example 3:
Input: root = [1]
Output: [1]


Constraints:

- The number of nodes in the tree is in the range [0, 100].
- -100 <= Node.val <= 100



Hint
=====

Binary Tree Traversals
----------------

         1 //Root Node
        / \
       2    3
      / \  / \
     4  5  6  7 //Leaf Nodes


| PreOrder  | root – left  – right  | 1-2-4-5-3-6-7 |
| InOrder   | left – root  – right  | 4-2-5-1-6-3-7 |
| PostOrder | left – right – root   | 4-5-2-6-7-3-1 |


Merge two lists/slices
---------------

Python

```python
a = [1,2,3]
b = [4,5]
a += b  # a = [1, 2, 3, 4, 5]
```

Go

```go
func main() {
	a := []int{1, 2, 3}
	b := []int{4, 5}
	a = append(a, b...)
	fmt.Println(a) // a = [1, 2, 3, 4, 5]
}
```



MyAnsert
==========

```python

def PreorderTraversal(self, root):
    res = []
    if root:
        res.append(root.data)
        res += self.PreorderTraversal(root.left)
        res += self.PreorderTraversal(root.right)
    return res

def inorderTraversal(self, root):
    res = []
    if root:
        res = self.inorderTraversal(root.left)
        res.append(root.data)
        res += self.inorderTraversal(root.right)
    return res

def PostorderTraversal(self, root):
    res = []
    if root:
        res = self.PostorderTraversal(root.left)
        res += self.PostorderTraversal(root.right)
        res.append(root.data)
    return res
```



Go

```go
func preorderTraversal(root *TreeNode) []int {
    res := []int{}
    if root != nil {
        res = append(res, root.Val)
        leftSubTree := preorderTraversal(root.Left)
        res = append(res, leftSubTree...)
        rightSubTree := preorderTraversal(root.Right)
        res = append(res, rightSubTree...)
    }
    return res
}

func inorderTraversal(root *TreeNode) []int {
    res := []int{}
    if root != nil {
        res = inorderTraversal(root.Left)
        res = append(res, root.Val)
        rightSubTree := inorderTraversal(root.Right)
        res = append(res, rightSubTree...)
    }
    return res
}

func postorderTraversal(root *TreeNode) []int {
    res := []int{}
    if root != nil {
        res = postorderTraversal(root.Left)
        rightSubTree := postorderTraversal(root.Right)
        res = append(res, rightSubTree...)
        res = append(res, root.Val)
    }
    return res
}
```