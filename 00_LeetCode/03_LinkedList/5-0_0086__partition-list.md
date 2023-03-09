Question
========



https://leetcode.com/problems/partition-list/


Given the head of a linked list and a value x, partition it such that all nodes less than x come before nodes greater than or equal to x.

You should preserve the original relative order of the nodes in each of the two partitions.


Example 1:
Input: head = [1,4,3,2,5,2], x = 3
Output: [1,2,2,4,3,5]


Example 2:
Input: head = [2,1], x = 2
Output: [1,2]
 

Constraints:

- The number of nodes in the list is in the range [0, 200].
- -100 <= Node.val <= 100
- -200 <= x <= 200


Answer
=====

```python
# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def partition(self, head: Optional[ListNode], x: int) -> Optional[ListNode]:
        head1 = list1 = ListNode(0, None)
        head2 = list2 = ListNode(0, None)
        while head != None :
            if head.val < x:
                list1.next = head
                list1 = list1.next
            else:
                list2.next = head
                list2 = list2.next
            head = head.next
        list2.next = None
        list1.next = head2.next
        return head1.next
```




```go
/**
 * Definition for singly-linked list.
 * type ListNode struct {
 *     Val int
 *     Next *ListNode
 * }
 */
func partition(head *ListNode, x int) *ListNode {
    list1 := &ListNode{0, nil}
    head1 := list1
    list2 := &ListNode{0, nil}
    head2 := list2
    for head != nil {
        if head.Val < x {
            list1.Next = head
            list1 = list1.Next
        } else {
            list2.Next = head
            list2 = list2.Next
        }
        head = head.Next
    }
    list2.Next = nil
    list1.Next = head2.Next
    return head1.Next
}
```