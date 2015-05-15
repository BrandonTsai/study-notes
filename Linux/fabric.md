Fabric
======

Call function
-------------

```py
def task(something=''):
    print "You said %s" % something
```

Fabric uses the following syntax for passing arguments to tasks:

```bash
 fab task:'hello'
 fab task:something='hello'
 fab task:foo=99,bar=True
```

Run Command
-----------

```py
from fabric.api import run, sudo

def task(pkg=''):
     sudo('apt-get update')
     sudo('apt-get install %s' % pkg)
```


Transmit Files
--------------

```py
from fabric.api import put
def task(something=''):
    put('conf/logrotate/myapp', '/etc/logrotate.d/', use_sudo=True, mode=0755)
```


Set config via Template
------------------------

use **[fabric.contrib.files.upload_template()](http://docs.fabfile.org/en/latest/api/contrib/files.html)** to set up config

#### (1) Use template with [Python string interpolation formatting](https://docs.python.org/2/library/stdtypes.html#string-formatting)

conf/rsyslog/myapp.conf

```
local4.*                         /var/log/%(log_file)
local4.*                         ~
```

fabfile.py

```py
from fabric.contrib.files import upload_template
from fabric.api import sudo

def set_rsyslog():
    source = 'conf/rsyslog/myapp.conf'
    target = '/etc/rsyslog.d/15-myapp.conf'
    context = {'logfile'='myapp.log'}
    upload_template(source, target, context, use_sudo=True)
    sudo('service rsyslog restart')
```

#### (2) Use template with [Jinja2](http://jinja.pocoo.org/docs/dev/) (Suggest)

conf/rsyslog/myapp.conf

```
local4.*                         /var/log/{{ log_file }}
local4.*                         ~
```

fabfile.py

```py
from fabric.contrib.files import upload_template
from fabric.api import sudo

def set_rsyslog():
    source = 'conf/rsyslog/myapp.conf'
    target = '/etc/rsyslog.d/15-myapp.conf'
    context = {'logfile'='myapp.log'}
    upload_template(source, target, context, use_jinja=True, use_sudo=True)
    sudo('service rsyslog restart')
```

Get Fabric Environment Setting
------------------------------

fabfile.py

use fabric environment as template context

```py
from fabric.api import env

def set_rsyslog():
    source = 'conf/rsyslog/myapp.conf'
    target = '/etc/rsyslog.d/15-myapp.conf'
    upload_template(source, target, env, use_jinja=True, use_sudo=True)
    sudo('service rsyslog restart')
```

Add custom runtime fabric env configuration.

```bash
$ cat >> myfabric_rc << EOF
logfile = myapp.log
EOF


$ fab -u ＜UserID＞ -p ＜Password＞ -H ＜Target IP＞ -c myfabric_rc set_rsyslog
```




