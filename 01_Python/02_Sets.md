

> Set Items:
> - **unordered**, 
> - No duplicate values
>

To create an empty set you have to use `set()`, not {};

Add/Join/Remove Sets
--------

```python
emptyColors = set()
colors = {"Black", "White", "Green"}
colors.add("Red")        # {'Red', 'White', 'Black', 'Green'}

colors.remove("Green")   # {'Red', 'White', 'Black'}
colors.discard("Green")  # If the item does not exist, discard() will NOT raise an error.
colors.remove("Green")   # If the item does not exist, remove() will raise an error.

# Remove the last item. Because sets are unordered, so you will not know what item that gets removed.
colors.pop()
# Empties the set
colors.clear()
```

Join Sets
--------

`Set1 + Set2` is not supported

```python
s1 = {1, 2, 3}
s2 = {'a', 'b', 'c'}
s1.update(s2)
print(s1)                   # {'b', 1, 2, 3, 'c', 'a'}
s1.update(["My", "list"])   # {1, 2, 3, 'c', 'a', 'b', 'list', 'My'}
print(s1)

```


Union and Difference
---------------------

```python
s1 = {1, 2, 3}
s2 = {3, 4, 5}
s3 = s1.union(s2)           # {1, 2, 3, 4, 5}
s4 = s1.difference(s2)      # {1, 2}
s5 = s1.intersection(s2)    # {3}
```


Convert to Tuple
----------------


Convert to List
---------------