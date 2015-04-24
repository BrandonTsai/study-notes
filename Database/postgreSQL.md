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

```
createuser -s -W my_user
dropuser my_user
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

