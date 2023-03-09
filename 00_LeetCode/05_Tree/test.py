from collections import deque


class Node:
    def __init__(self, key):
        self.left = None
        self.right = None
        self.val = key


def inorderTraversal(root):
    res = []
    if root != None:
        res = inorderTraversal(root.left)
        res.append(root.val)
        res += inorderTraversal(root.right)
    return res


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


if __name__ == "__main__":
    n6 = Node(6)
    n5 = Node(5)
    n4 = Node(4)
    n4.left = n5
    n4.right = n6
    n3 = Node(3)
    n2 = Node(2)
    n2.right = n3
    root = Node(1)
    root.left = n2
    root.right = n4
    print(inorderTraversal(root))
    print(bfs(root))
    print(dfs(root))
