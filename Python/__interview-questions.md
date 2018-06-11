# Python Interview Questions



`What is the difference between deep and shallow copy`
-----------------------------------------------------

ref: https://www.programiz.com/python-programming/shallow-deep-copy


**Shallow:**:
- object.copy() 
- creates a new object which stores the reference of the original elements.
    - **doesn't create a copy of nested objects**,
    - just copies the reference of nested objects.  

**Deep:**:
- object.deepcopy()
- creates a new object and recursively adds the copies of nested objects present in the original elements.


---
`What is the difference between list and tuples?`
-----------------------------------------------------

**List:**
- mutable, 
    - i.e they can be edited. 
    - can NOT be used as a key in a dictionary,
- Syntax: list_1 = [10, ‘Chelsea’, 20]

**Tuples:** 
- immutable
    - (tuples are lists which can’t be edited).
    - can't delete an element or sort a tuple.
    - can used as a key in a dictionary, 
- Syntax: tup_1 = (10, ‘Chelsea’ , 20)

---
`What is 'dictionary' in Python`
-----------------------------

defines one-to-one relationship between keys and values. Dictionaries contain pair of keys and their corresponding values. Dictionaries are indexed by keys.


---
`What is the usage of help() and dir() function`
---------------------------------------


help(obj):
- return the Python documentation of a particular object, method, attributes

dir(obj): 
- return a list of attributes for the object


---
`Ternary Operators`
-----------------

- used to show the conditional statements. 
- [on_true] if [expression] else [on_false]

ex:
```python
 result = 'pass' if score >= 60 else "fail"
```

---
`Monkey Patching`
----------------

the term monkey patch only refers to dynamic modifications of a class or module at run-time.

Consider the below example:

```python
# m.py
class MyClass:
    def f(self):
        print "this is f"
```

We can then run the monkey-patch testing like this:

```python
import m
def monkey_f(self):
  print "this is monkey."
 
m.MyClass.f = monkey_f
obj = m.MyClass()
obj.f()
```
The output will be as below:

```
this is monkey.
```

---
`Global Interpreter Lock (GIL)`
--------------

a mutex that protects access to Python objects, preventing multiple threads from executing Python bytecodes at once. 


---
`memory managed in Python?`
-------------------------
 
- managed by Python private heap space. 
- All Python objects and data structures are located in a private heap. 
- The programmer does not have an access to this private heap and interpreter takes care of this Python private heap. 
- *Python memory manager*: allocate Python heap space. 
- *Inbuilt garbage collector*: recycle all the unused memory and frees the memory and makes it available to the heap space.


---
`Whenever Python exits, why isn’t all the memory de-allocated?`
-----------------------------------------------
- Python ordinarily frees most objects as soon as their reference count reaches zero. 
- when you declare *'circular references'* in your object declarations and implement a custom *\_\_del\_\_* destructor method in one these classes. Objects referenced from the global namespaces of Python modules are not always deallocated when Python exits.
- It is impossible to de-allocate those portions of memory that are reserved by the C library.


---
`Inheritance in Python`
-----------------------

Inheritance allows One class to gain all the members(say attributes and methods) of another class

```python
class Person:

    def __init__(self, first, last):
        self.firstname = first
        self.lastname = last

    def Name(self):
        return self.firstname + " " + self.lastname

class Employee(Person):

    def __init__(self, first, last, staffnum):
        Person.__init__(self,first, last)
        self.staffnumber = staffnum

    def GetEmployee(self):
        return self.Name() + ", " +  self.staffnumber
```



---
`What is Flask`
---------------

Flask is a python-based web micro framework 