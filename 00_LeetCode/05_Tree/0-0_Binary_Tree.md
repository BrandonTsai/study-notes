Tree
=====


Binary Tree
===========

Data structure of a node

```python

# A Python class that represents 
# an individual node in a Binary Tree
class Node:
    def __init__(self,key):
        self.left = None
        self.right = None
        self.val = key

    def __init__(self,key, left, right):
        self.left = left
        self.right = right
        self.val = key
```


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


```python

def PreorderTraversal(self, root):
    res = []
    if root:
        res.append(root.data)
        res = res + self.PreorderTraversal(root.left)
        res = res + self.PreorderTraversal(root.right)
    return res

def InorderTraversal(self, root):
    res = []
    if root:
        res = self.InorderTraversal(root.left)
        res.append(root.data)
        res = res + self.InorderTraversal(root.right)
    return res

def PostorderTraversal(self, root):
    res = []
    if root:
        res = self.PostorderTraversal(root.left)
        res = res + self.PostorderTraversal(root.right)
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


BFS
----


DFS
----


Balanced Tree
============


Red-Black Tree
---------------


AVL Tree
---------


Binary Search Tree
================

A binary search tree is a binary tree in which every node fits a specific ordering property:
all_left_descendents <= n < all_right_descendents. This must be true for each node n.


