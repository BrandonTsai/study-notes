Debian Local Repository
=======================



Unauthenticated Local Repo
--------------------------

### Repository Node


Install apache and create repo folder.

```bash
apt-get install apache2
mkdir /var/www/html/myrepo
```

Then copy deb files to local repo folder

```bash
cp *.deb /var/www/html/myrepo/
```


build Local Repo which allow multiple version 

```
cd /var/www/html/myrepo/
dpkg-scanpackages -m . /dev/null | gzip -9c > Packages.gz
```


### Client 

add local repo to apt source list

```bash
# cat >> /etc/apt/sources.list.d/local.list <<EOF
deb http://＜IP＞/myrepo /
EOF
```


allow system to install unauthenticated packages

```bash
# cat >> /etc/apt/apt.conf.d/50AllowUnauthenticated << EOF
APT::Get::AllowUnauthenticated "true";
EOF
```


Authenticated Local Repo
------------------------


apt-catcher
-----------


