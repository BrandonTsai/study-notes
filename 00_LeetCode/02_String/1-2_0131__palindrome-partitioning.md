Questions
=========

https://leetcode.com/problems/palindrome-partitioning/

Given a string s, partition s such that every substring of the partition is a palindrome. Return all possible palindrome partitioning of s.

A palindrome string is a string that reads the same backward as forward.

 

Example 1:

Input: s = "aab"
Output: [["a","a","b"],["aa","b"]]
Example 2:

Input: s = "a"
Output: [["a"]]
 

Constraints:

1 <= s.length <= 16
s contains only lowercase English letters.


Answer
======

Approach: BackTrack
------------------

traverse and check every prefix s[:i] of s
- if prefix s[:i] is a palindrome, then process the left suffix s[i:] recursively
since the suffix s[i:] may repeat, the memory trick can save some time



Complexity Analysis

Time Complexity : \mathcal{O}(N \cdot 2^{N})O(N⋅2 
N
 ), where NN is the length of string ss. This is the worst-case time complexity when all the possible substrings are palindrome.