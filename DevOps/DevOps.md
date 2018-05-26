DevOps
======

Introduction
------------

A good talk about DevOps
https://theagileadmin.com/what-is-devops/

>> DevOps is the practice of operations and development engineers participating together in the entire service lifecycle, from design through the development process to production support.

Better methods/tools are developed every once in a while. Keep Learning, Keep Fighting.


Develop Process
---------------

### Plan

Design Thinking & UX + Business Model Canvas


Project Management Tools:

```
* Trello/Zenhub
* Redmine
* Slack
```

Document Tools:

```
* AsciiDoc
* Gitbook
* Readthedoc
```

Bug Tracking System:

```
* Mantis
```

### Build & Unit Testing:

build tools:
```
* Maven
* Gradle
```

Continuous Integration tools:

```
* Jenkins
* Gitlab-CI
* Travis-CI
```

### Release & Deployment

Continous Deployment to different environment:
* RD Integration Tests Environment
* QA Environment
* Production Environment

為了確保部署軟體的功能一致，「持續部署」必須採用同一個包裝好的套件(package)，
To make sure the consistance, same package must be used during the CD process.

Configuraiton Externalization: DO NOT configure settings by hard-coded
另一個達到「持續部署」的重要手段是要針對軟體可以客制化的功能，將其組態/設定外部化(configuraiton externalization)，簡單點講：就是不要將設定(settings)寫死(hard-coded)在程式碼裡面。


Infrastructure as a Service

```
* Amazon Web Services (AWS)
* OpenStack
```

Virtualization Platforms

```
* VMware
* KVM
* VirtualBox
```

Containerization Tools

```
* Docker
```

Linux OS Installation On Bare Machine

```
* Kickstart
* Cobbler
* MAAS
```

Configuration Management

```
* Puppet + MCollective
* Chef
* SaltStack
* Ansible
* Ubuntu Juju
```

Application Deployment

```
* Fabric
* Capistrano
```


Other Useful Tools
------------------

refer:
- https://medium.com/@arashsami/a-short-list-of-devops-tools-dd786ce32da8

### Application Servers:

* JBoss
* Tomcat
* Jetty
* Glassfish
* Websphere
* Weblogic

### Web Servers

* **Nginx**
* Apache
* IIS

### Queues, Caches, etc.

* ActiveMQ
* **RabbitMQ**
* **memcache**
* varnish
* squid

### Databases

* MySQL
* **PostgreSQL**
* OpenLDAP
* **MongoDB**
* Cassandra
* Redis
* **Oracle**
* MS SQL

### Monitoring, Alerting, and Trending

* New Relic
* **Nagios**
* Icinga
* Graphite
* Ganglia
* Cacti
* PagerDuty  j
* Sensu

### Logging

please refer:

- http://blog.takipi.com/the-7-log-management-tools-you-need-to-know/
- http://www.findbestopensource.com/tagged/log-analysis

SaaS:

* PaperTrail
* Loggly
* Splunk
* SumoLogic

OpenSource:

* Logstash
* [graylog2](http://graylog2.org/)

### Process Supervisors

* Monit
* runit
* **Supervisor**
* god
* Blue Pill
* Upstart
* systemd
* [pm2](http://pm2.keymetrics.io/)

### Security

* Snorby Threat Stack
* Tripwire
* Snort
