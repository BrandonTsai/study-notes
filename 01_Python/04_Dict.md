---
`What is 'dictionary' in Python`
-----------------------------

defines one-to-one relationship between keys and values. Dictionaries contain pair of keys and their corresponding values. Dictionaries are indexed by keys.


As of Python version 3.7, dictionaries are ordered. 
In Python 3.6 and earlier, dictionaries are unordered.

```python

myDict = {
    "Brancon": 187,
    "lulu": 156
}

x = myDict.keys()   # dict_keys(['Brancon', 'lulu'])
y = myDict.values() # dict_values([187, 156])
z = myDict.items()  # dict_items([('Brancon', 187), ('lulu', 156)])



```