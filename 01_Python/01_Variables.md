

- A variable name can NOT start with a number
- Variable names are `Case-Sensitive` (age, Age and AGE are three different variables)
- Python has no command for declaring a data type. The data type is defined when first value assigned.
- Python does not have Pointers


| Usage          | Data Type                    |
| -------------- | ---------------------------- |
| Text Type      | str                          |
| Numeric Types  | int, float, complex          |
| Boolean Type   | bool (True/False)            |
| Binary Types   | bytes, bytearray, memoryview |
| None Type      | None                         |
| Sequence Types | list, tuple, range           |
| Mapping Type   | dict                         |
| Set Types      | set, frozenset               |



```python
name = "Brandon"
married = True
age = 36
IELTS = 6.5
children = None

### Assign multiple values
x, y, z = "Orange", 1, False
```

Check a variable's data type via type() builtin function:

```python
print(type(name)) 
print(type(married))
print(type(age))
print(type(IELTS))
print(type(children))

# Outputs:
# <class 'str'>
# <class 'bool'>
# <class 'int'>
# <class 'float'>
# <class 'NoneType'>

```


Copy
----

```python
a = b = 123
print(a, b) ## out = 123 123
b = 456
print(a, b) ## out = 123 456
```

Casting
------

Casting in python is therefore done using constructor functions:

`int()` 
`float()` 
`str()` 
`bool()`

```python
a = 123
b = 3.1415
c = True
d = "False"
e = ""

a1 = complex(a)
a2 = float(a)

b1 = int(b) 
b2 = str(b)

c1 = int(c)
d1 = bool(d)
e1 = bool(e)

print(a1, type(a1)) # (123+0j) 	<class 'complex'>
print(a2, type(a2)) # 123.0 	<class 'float'>
print(b1, type(b1)) # 3 		<class 'int'>, 	Notice .1415 is removed
print(b2, type(b2)) # 3.1415 	<class 'str'>
print(c1, type(c1)) # 1 		<class 'int'>, 	Notice the vaule is 1
print(d1, type(d1)) # True 		<class 'bool'> 	Notice the value is True
print(e1, type(e1)) # False 	<class 'bool'> 	Notice the value is False
```

String
-----

reverse string

```python
txt = "Hello World"
reverseTxt = txt[::-1]
```