Implementing Your Own Linked List
===================================


> Go do not have `class` as Python

```go
// Node represents a node of linked list
type Node struct {
	data int
	next  *Node
}

// LinkedList represents a linked list
type LinkedList struct {
	head *Node
}
```


Traverse Linked List
=====================

Use a while loop to traverse the linked list

```go
func main() {
    var n2 = Node{2, nil}
    var n1 = Node{1, &n2}
    var l = LinkedList{&n1}
    ptr := l.head
    for ptr != nil {
        fmt.Print(ptr.data, " -> ")
        ptr = ptr.next
    }
    fmt.Println("nil")
}
```

Or you cann implement the Print() Method

```go
// Print displays all the nodes from linked list
func (l *LinkedList) Print() {
	if l.head == nil {
		fmt.Println("No nodes in list")
	}
	ptr := l.head
	for ptr != nil {
		fmt.Print(ptr.data, " -> ")
		ptr = ptr.next
	}
	fmt.Println("nil")
}

func main() {
	var n2 = Node{2, nil}
	var n1 = Node{1, &n2}
	var l = LinkedList{&n1}
	l.Print()
}
```

Insert
======


```go
func (l *LinkedList) InsertFirst(val int) {
	n := Node{val, l.head}
	l.head = &n
}

func (l *LinkedList) InsertLast(val int) {
	n := Node{val, nil}
	if l.head == nil {
		l.head = &n
		return
	}

	ptr := l.head
	for ptr.next != nil {
		ptr = ptr.next
	}
	ptr.next = &n
}

func main() {
	l := LinkedList{}
	l.InsertLast(2)
	l.InsertFirst(1)
	l.Print()
}
```






Remove
=====


```go

func (l *LinkedList) DeleteFirst() error {
	// validate the position
	fmt.Println("Delete Head:", l.head.data)
	if l.head == nil {
		return errors.New("[Error] Can not delete first node. No nodes in list")
	}
	if l.head.next == nil {
		l.head = nil
	} else {
		l.head = l.head.next
	}
	return nil
}

func (l *LinkedList) DeleteLast() error {
	// validate the position
	if l.head == nil {
		return errors.New("[Error] Can not delete last node. No nodes in list")
	}
	// handle only one node
	if l.head.next == nil {
		fmt.Println("Delete Last:", l.head.data)
		l.head = nil
		return nil
	}
	ptr := l.head
	for ptr.next.next != nil {
		ptr = ptr.next
	}
	fmt.Println("Delete Last:", ptr.next.data)
	ptr.next = nil
	return nil
}

func main() {
	l := LinkedList{}
	l.InsertFirst(1)
	l.InsertLast(2)
	l.InsertLast(3)
	l.Print()
	err := l.DeleteFirst()
	if err != nil {
		fmt.Println(err.Error())
	} else {
		l.Print()
	}

	err = l.DeleteLast()
	if err != nil {
		fmt.Println(err.Error())
	} else {
		l.Print()
	}
}

```