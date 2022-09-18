
https://www.geeksforgeeks.org/stack-in-python/

A stack is a linear data structure that stores items in a `Last-In/First-Out (LIFO)`

Stack in Python can be implemented using the following ways:
- list
- Collections.deque
- queue.LifoQueue

Deque is preferred over the list in the cases where we need quicker append and pop operations from both the ends of the container, as deque provides an O(1) time complexity for append and pop operations as compared to list which provides O(n) time complexity.



| Stack function | list             | deque             | Note                                                    |
| -------------- | ---------------- | ----------------- | ------------------------------------------------------- |
| empty()        |                  |                   | Returns whether the stack is empty                      |
| size()         | len(list)        | len(deque)        | Returns the size of the stack                           |
| top()/peek()   | list[-1]         | deque[-1]         | Returns a reference to the topmost element of the stack |
| push(a)        | lsit.append('a') | deque.append('a') | Inserts the element ‘a’ at the top of the stack         |
| pop()          | list.pop()       | deque.pop()       | Deletes the topmost element of the stack                |

```python
>>> from collections import deque
>>> stack = deque()
>>> stack.append('a')
>>> stack.append('b')
>>> print(stack)
deque(['a', 'b'])
>>> stack.pop()
'b'
>>> print(stack)
deque(['a'])
>>> stack[0]
'a'
>>> stack[-1]
'a'
>>> list1 = list(stack)
>>> print(list1)
['a']
>>> for n in stack:
...   print(n)
...
a
>>> if stack:
...   print(stack[-1])
...
a
```