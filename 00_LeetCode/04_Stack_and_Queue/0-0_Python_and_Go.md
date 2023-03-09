what is Stack
==========

- LIFO (last-in first-out) 
- Often useful is in certain **recursive** algorithms. Sometimes you need to push temporary data onto a stack as you recurse, but then remove them as you backtrack (for example, because the recursive check failed). A stack offers an intuitive way to do this.


What is Queue
==========

- FIFO (first-in first-out)
- Often used is in breadth-first search or in implementing a cache.




Python
=======

Using `List`
-----------

```python
# Stack
stack = ["Red", "Yellow", "White"]
stack.append("Black")
stack.pop()             # stack = ['Red', 'Yellow', 'White']

# Queue
queue = ["Red", "Yellow", "White"]
queue.append("Black")
queue.pop(0)            # queue = ['Yellow', 'White', 'Black']
```


Using `Deque`
------------

A deque is short for a double-ended queue.  
Internally, deque is a representation of a doubly-linked list which stores at least two more pointers with each item.
hence, deque use more memory space than list, but lists have to reallocate memory when a new item is inserted
Please refer https://dev.to/v_it_aly/python-deque-vs-listwh-25i9 for more comparasion of deque and list.

- deque.append(Val): add new value to the end
- deque.pop(): remove the last value
- deque.popleft(): remove the first value

```python

from collections import deque
# Stack
stack = deque(["Red", "Yellow", "White"])
stack.append("Black")
top = stack.pop()           # stack = deque(['Red', 'Yellow', 'White'])

# Queue
queue = deque(["Red", "Yellow", "White"])
queue.append("Black")
first = queue.popleft()     # queue = deque(['Yellow', 'White', 'Black'])
```


Go
===

Go does not have buildin module for stack or queue.
So we need to implement it with slice manually.



Using Slice
-----------

stack

```go
package main

import (
	"errors"
	"fmt"
)

type stack []int

func (s *stack) IsEmpty() bool {
	return len(*s) == 0
}

func (s *stack) Push(val int) {
	*s = append(*s, val)
}

func (s *stack) Pop() {
	if s.IsEmpty() {
		errors.New("Stack is empty")
	}
	*s = (*s)[:len(*s)-1]
}

func main() {
	myStack := stack{}
	myStack.Push(1)
	myStack.Push(2)
	fmt.Println(myStack)
	myStack.Pop()
	fmt.Println(myStack)
	myStack.Pop()
	myStack.Pop()
}
```

queue

```go
package main

import (
	"errors"
	"fmt"
)

type queue []int

func (s *queue) IsEmpty() bool {
	return len(*s) == 0
}

func (s *queue) Enqueue(val int) {
	*s = append(*s, val)
}

func (s *queue) Dequeue() {
	if s.IsEmpty() {
		errors.New("Queue is empty")
	}
	*s = (*s)[1:len(*s)]
}

func main() {
	myQueue := queue{}
	myQueue.Enqueue(1)
	myQueue.Enqueue(2)
	fmt.Println(myQueue)
	myQueue.Dequeue()
	fmt.Println(myQueue)
	myQueue.Dequeue()
	myQueue.Dequeue()
}
```