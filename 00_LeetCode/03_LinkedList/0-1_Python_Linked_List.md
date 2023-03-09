

Performance Comparison: Lists vs Linked Lists
=============

In Python, however, lists are dynamic arrays. That means that the memory usage of both lists and linked lists is very similar.

Python lists is that inserting or removing elements that are not at the end of the list requires some element shifting in the background, making the operation more complex in terms of time spent.

when you try inserting an element closer to or at the beginning of the list, the average time complexity will grow along with the size of the list: O(n).

Linked lists, on the other hand, are much more straightforward when it comes to insertion and deletion of elements at the beginning or end of a list, where their time complexity is always constant: O(1).



Implementing Your Own Linked List
===================================


> 1. `__repr__` is a special method used to represent a class's objects as a string.
> So that you can use print() method to print the content of a class's objects.




```python
class Node:
    def __init__(self, data):
        self.data = data
        self.next = None

    def __repr__(self):
        return self.data

class LinkedList:
    def __init__(self):
        self.head = None
    
    def __init__(self, nodes=None):
        self.head = None
        if nodes is not None:
            node = Node(data=nodes.pop(0))
            self.head = node
            for elem in nodes:
                node.next = Node(data=elem)
                node = node.next

    def __repr__(self):
        node = self.head
        nodes = []
        while node is not None:
            nodes.append(node.data)
            node = node.next
        nodes.append("None")
        return " -> ".join(nodes)
```



Traverse Linked List
=====================

Use a while loop to traverse the linked list

```python
llist = LinkedList(["a", "b", "c"])
node = llist.head
while node is not None:
  print(node.data)
  node = node.next
```


or implement the `__iter__()` method in LinkedList to make it iterable.

```python
class LinkedList:
    def __init__(self):
        self.head = None

    def __init__(self, nodes=None):
        self.head = None
        if nodes is not None:
            node = Node(data=nodes.pop(0))
            self.head = node
            for elem in nodes:
                node.next = Node(data=elem)
                node = node.next

    def __repr__(self):
        node = self.head
        nodes = []
        while node is not None:
            nodes.append(node.data)
            node = node.next
        nodes.append("None")
        return " -> ".join(nodes)

    def __iter__(self):
        node = self.head
        while node is not None:
            yield node
            node = node.next
```

> The `yield` statement suspends a function’s execution and sends a value back to the caller, but retains enough state to enable the function to resume where it left off.


We can then use for loop to traverse each node in the Linked List.

```python
for node in llist:
  print(node.data)

```

Insert
======

```python
def add_first(self, node):
    node.next = self.head
    self.head = node

def add_last(self, node):
    """
    traverse the whole list until you reach the end
    """
    if self.head is None:
        self.head = node
        return
    current_node = self.head
    while current_node.next is not None:
        current_node = node.next
    current_node.next = node

def add_after(self, target_node_data, new_node):
    if self.head is None:
        raise Exception("List is empty")

    for node in self:
        if node.data == target_node_data:
            new_node.next = node.next
            node.next = new_node
            return

    raise Exception("Node with data '%s' not found" % target_node_data)
```



Remove
=====

```python
def remove_node(self, target_node_data):
    if self.head is None:
        raise Exception("List is empty")

    if self.head.data == target_node_data:
        self.head = self.head.next
        return

    previous_node = self.head
    for node in self:
        if node.data == target_node_data:
            previous_node.next = node.next
            return
        previous_node = node

    raise Exception("Node with data '%s' not found" % target_node_data)
```