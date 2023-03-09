Question
=========

https://leetcode.com/problems/remove-nth-node-from-end-of-list/


Given the head of a linked list, remove the nth node from the end of the list and return its head.

Example 1:
Input: head = [1,2,3,4,5], n = 2
Output: [1,2,3,5]

Example 2:
Input: head = [1], n = 1
Output: []

Example 3:
Input: head = [1,2], n = 1
Output: [1]


Answer
======

Approach: Two Pointers 
--------------


The slower pointer is n+1th behind the faster pointer.
So when the faster pointer reach the end, the slower pointer is the n+1th node from the end.
Then just update the next field of the slower pointer.


Python

```python
class Solution:
    def removeNthFromEnd(self, head: Optional[ListNode], n: int) -> Optional[ListNode]:
        fast = head
        slow = ListNode(-1,  head)

        for i in range(n):
            fast = fast.next

        while fast != None:
            fast = fast.next
            slow = slow.next

        if slow.next == head:
            return head.next

        slow.next= slow.next.next
        return head
```


Go

```go
func removeNthFromEnd(head *ListNode, n int) *ListNode {

    fast := head
    slow := &ListNode{0, head}

    // move fast only
    for i := 0; i < n ; i++ {
        fast = fast.Next
    }

    // move together
    for fast != nil {
        fast = fast.Next
        slow = slow.Next
    }

    //remove the nth
    if slow.Next == head {
        return head.Next
    }
    slow.Next= slow.Next.Next
    return head

}

```