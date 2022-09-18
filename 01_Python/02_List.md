# Data Model

https://docs.python.org/3/tutorial/datastructures.html



Python does not have built-in support for Arrays, but Python Lists can be used instead.

```python
>>> squares = [1, 4, 9, 16, 25]
>>> len(squares)
5
>>> squares[0]    # indexing returns the item
1
>>> squares[-1]   # indexing returns the item
25
>>> squares[:-1]  # slicing returns a new list
[1, 4, 9, 16]
>>> squares[3:]   # slicing returns a new list
[16, 25]
>>> squares[5:]   # It return empty list instead of IndexError
[]
>>> squares[6:]   # It return empty list instead of IndexError
[]
```

Initialize a list with any size and values
---------------------------------------------

```python
list1 = [0] * 10
print(list1)
# [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

print(len(list1))
# 10
```



Add/Remove elements
-------------------

```python
colors = ["Red", "Yellow", "White"]
colors.append("Black")            # ['Red', 'Yellow', 'White', 'Black']
colors.insert(0, "Blue")          # ['Blue', 'Red', 'Yellow', 'White', 'Black']
colors.remove("Red")              # ['Blue', 'Yellow', 'White', 'Black']
colors.pop(0)                     # ['Yellow', 'White', 'Black']
colors.pop()  # = colors.pop(-1)  # ['Yellow', 'White'] 
colors.clear()                    # []
```

The pop() method removes and returns last object or obj from the list.

Join Two Lists
---------

```python
list1 = ["a", "b", "c"]
list2 = [1, 2, 3]

list3 = list1 + list2
print(list3)            # ['a', 'b', 'c', 1, 2, 3]

list1.extend(list2)
print(list1)            # ['a', 'b', 'c', 1, 2, 3]
print(list2)            # [1, 2, 3]
```


Copy
----

`shallow copy`: **Copy by Value**

```python
list1 = ["a", "b", "c"]
list2 = list1.copy()

list2.append("d")
print(list1)    # ['a', 'b', 'c']
print(list2)    # ['a', 'b', 'c', 'd']


list3 = list(list1)
list3.remove("a")
print(list1)    # ['a', 'b', 'c']
print(list3)    # ['b', 'c']

list4 = list1[:]
list4.extend(["x","y"])
print(list1)    # ['a', 'b', 'c']
print(list4)    # ['a', 'b', 'c', 'x', 'y']
```


**Copy by reference**

```python
list1 = list2
list5.pop()
print(list1) # ['a', 'b']
print(list5) # ['a', 'b']
```

Loop
----

```python
list1 = ["a", "b", "c"]
for x in list1:
	print(x)

for i in range(len(list1)):
    print(i, list1[i])
```

Comprehensive
------------

```python
list1 = [2, -4, 0, -1, 3, 9]
list2 = [ x for x in list1 if x > 0 ] #[2, 3, 9]
```


Sort
----

```python
list1 = [2, -4, 0, -1, 3, 9]
list1.reverse()                 # [9, 3, -1, 0, -4, 2]
list1.sort()                    # [-4, -1, 0, 2, 3, 9]
list1.sort(reverse = True)      # [9, 3, 2, 0, -1, -4]
```

Customize Sort Function

```python
def myFun(n):
  return abs(n)

list1 = [2, -4, 0, -1, 3, 9]
list1.sort(key=myFun)
print(list1)    # [0, -1, 2, 3, -4, 9]

list2 = [("Brandon", 100), ("Lia", 85), ("John", 60)]
list2.sort(key=lambda x: x[1])
print(list2)    # [('John', 60), ('Lia', 85), ('Brandon', 100)]
```

Reverse a list
--------------

```python
list1 = [2, -4, 0, -1, 3, 9]
list2 = list1[::-1]                     # [9, 3, -1, 0, -4, 2]
list1.reverse()                         # [9, 3, -1, 0, -4, 2]
```


Convert to Tuple
----------------


Convert to Set
---------------



Find the index of element
--------------------------


```python
list1 = [1, 1, 2, 2, 2, 5]
print(list1.index(1))
print(list1.index(2))
print(list1.index(5))
```




