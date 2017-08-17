Testing
=======



nosetests
---------

**Unit Testing Tool**

refer: 

- http://fcamel-life.blogspot.tw/2010/08/nosetests.html
- http://nose.readthedocs.org/en/latest/usage.html



**Installation**

```
easy_install nose
```

or 

```
pip install nose
```

**Usage**


`nosetests [options] [(optional) test files or directories]`

執行目前目錄下所有測試：

```
nosetests
```

只執行特定測試檔案

```
nosetests test/test_format_convert.py
```

使用四個 CPU 平行執行測試：
```
nosetests --processes=4
```

只執行上回失敗的測試：
```
nosetests --failed
```

pep8, autopep8, flake8
----------------------

**python format checking**

please refer:

- http://pep8.readthedocs.org/en/latest/
- https://pypi.python.org/pypi/autopep8/
- http://flake8.readthedocs.org/en/latest/

