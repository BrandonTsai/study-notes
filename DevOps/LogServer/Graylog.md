GrayLog
========

Installation on Ubuntu 14.04
----------------------------

refer: https://www.digitalocean.com/community/tutorials/how-to-install-graylog2-and-centralize-logs-on-ubuntu-14-04


### Install MongoDB

```
$ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
$ echo 'deb http://downloads-distro.mongodb.org/repo/debian-sysvinit dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
$ sudo apt-get update
$ sudo apt-get install mongodb-org
```

### Install Java 7

```
$ sudo add-apt-repository ppa:webupd8team/java
$ sudo apt-get update
$ sudo apt-get install oracle-java7-installer
```

### Install Elasticsearch

download latest version of deb file from [Official Website](https://www.elastic.co/downloads/elasticsearch)


```
$ wget https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.5.2.deb
$ sudo dpkg -i elasticsearch-1.5.2.deb
```

change the Elasticsearch setting ( /etc/elasticsearch/elasticsearch.yml ):

```
cluster.name: graylog2
network.bind_host: localhost
script.disable_dynamic: true
```

restart Elasticsearch and testing

```
$ sudo service elasticsearch restart
$ curl -XGET 'http://localhost:9200/_cluster/health?pretty=true'
```

and make sure there is no Exception log in */var/log/elasticsearch/elasticsearch.log*


### Install Graylog2 server

```
$ wget https://packages.graylog2.org/repo/packages/graylog-1.0-repository-ubuntu14.04_latest.deb
$ sudo dpkg -i graylog-1.0-repository-ubuntu14.04_latest.deb
$ sudo apt-get install apt-transport-https
$ sudo apt-get update
$ sudo apt-get install graylog-server
```

replace the password_secret

```
$ sudo apt-get install pwgen
$ SECRET=$(pwgen -s 96 1)
$ sudo -E sed -i -e 's/password_secret =.*/password_secret = '$SECRET'/' /etc/graylog2.conf
```

replace root_password

```
$ PASSWORD=$(echo -n password | shasum -a 256 | awk '{print $1}')
$ sudo -E sed -i -e 's/root_password_sha2 =.*/root_password_sha2 = '$PASSWORD'/' /etc/graylog2.conf
```


update /etc/graylog/server/server.conf setting

```
rest_transport_uri = http://127.0.0.1:12900/
elasticsearch_shards = 1
```


restart graylog server

```
service graylog-server restart
```

tail log and make sure it is runnign correctly.


```
$ tail -f /var/log/graylog-server/server.log
```


### Install Graylog2 web

```
sudo apt-get install graylog-web
```

update Secret key

```
$ SECRET=$(pwgen -s 96 1)
$ sudo -E sed -i -e 's/application.secret=.*/application.secret='$SECRET'/' /etc/graylog/web/web.conf 
```

update /etc/graylog/web/web.conf setting

```
raylog2-server.uris="http://127.0.0.1:12900/"
```


restart service

```
service graylog-web restart
```


connect to **http://Your_Public_Ip:9000/** and make sure you can login with the admin



