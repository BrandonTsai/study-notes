https://realpython.com/linked-lists-python/#performance-comparison-lists-vs-linked-lists



Understanding Linked Lists
=========================


While lists use a **contiguous memory block** to store references to their data,
linked lists store **references** as part of their own elements.

Each element of a linked list is called a **node**, and every node has two different fields:

- Data: contains the value to be stored in the node.
- Next: contains a "reference" to the next node on the list.


Performance
=============

Unlike an array or a list, a linked list does not provide constant time access to a particular "index" within the list. This means that if you'd like to find the Kth element in the list, you will need to iterate through K elements.

However, inserting or removing elements to a list that are not at the end requires some element shifting in the background, making the operation more complex in terms of time spent.when you try inserting an element closer to or at the beginning of the list, the average time complexity will grow along with the size of the list: O(n).

On the other hand, The benefit of a linked list is that you can insert or delete elements at the beginning in constant time : O(1).
For specific applications, this can be useful.



Doubly Linked Lists
==================





Circular Linked Lists
=================