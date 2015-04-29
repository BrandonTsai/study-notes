# PostgreSQL 

User Guide: http://twpug.net/docs/postgresql-doc-8.0-zh_TW/

## Installation

refer: https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-14-04

```
sudo apt-get update
sudo apt-get install postgresql postgresql-contrib
```

## Database Management

su as default postgreSQL admin

```
sudo -i -u postgres
```

### User Management

The default authentication mode is set to 'ident' 
which means a given Linux user xxx can only connect as the postgres user xxx.
Therefore, it is better to create a new Linux user by 'adduser my_user' command

by command:
```
createuser -W my_user
dropuser my_user
```

by SQL:
```
postgres=# CREATE USER my_user PASSWORD 'yyy';
```

list all users:
```
postgres=# SELECT * FROM pg_user;
postgres=# \du 
```

allow user to access database:
```
GRANT ALL PRIVILEGES ON DATABASE mydb to my_user;
```

Login:
```
psql -U my_user -h localhost -d my_db -W
```

reset password:
```
alter user my_user with password 'new_password';
```


### DB Management

create:
```
createdb mydb
```

delete:
```
dropdb mydb
```

access:
```
psql mydb
```

list:
```
\list or \l: list all databases
```


To switch databases:

```
\connect database_name
```

### Table Management

list
``` 
\dt: list all tables in the current database
```

