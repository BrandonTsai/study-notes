DevOps
======

Introduction
------------

refer:
- http://www.ithome.com.tw/news/87144
- http://www.arthurtoday.com/2011/10/devops.html#ixzz3aAnmI5mf


![DevOps](http://www.collab.net/sites/all/themes/collabnet/_media/solutions/devops/solution-s-curve.png)

因為業務為了滿足客戶或是為了拿到案子，總是會隨著「情勢」的變化而要求軟體開發人員做「Change」，所以，軟體開發人員都會覺業務都在亂搞，只想操死他們而已，同樣的情況也會發生在軟體開發人員和軟體維運人員的身上，軟體開發人員為了滿足使用者的需求，也會不斷的上新版本，但是，新版本通常是會造成新問題的，因此，會增加軟體維運人員的工作量，所以，軟體維運人員會傾向不要修改，可是，軟體開發人員則是不得不改，兩者之間就會產生一個叫做「Wall of Confusion」的東西哩 !


DevOps開發方法是敏捷（Agile）以及精實（Lean）開發概念的延伸，有別於傳統開發流程，DevOps開發方法打破每個獨立的階段，從需求分析、系統設計、程式開發、安裝測試、後續維護再回到第一階段，形成一個封閉迴圈。

DevOps開發方法要開發人員持續改善並整合不同的階段，加以組織過去任務所發生的事，開發人員需要自動化的工作流程，自動化開發周期的每一個階段，不僅需要自動化測試，還要自動化部署，且提供自動化的數據給所有參與的人，讓所有人可以合作。


>> Notes:
>> 1. DevOps = Agile/Lean + Automatic ?
>> 2. 永遠有更好的工具和方法，Keep Learning, Keep Fighting.
>> 3. Think: 先做 Design Thinking 再 DevOps? 還是 DevOps 是 Design Thinking 的一部分?


Develop Process
---------------


### Plan

Design Thinking & UX + Business Model Canvas 


Project Management Tools:
* Trello
* Redmine
* Slack

Document Tools:
* AsciiDoc
* Gitbook
* Readthedoc

Bug Tracking System:
* Mantis

### Code

Hacking:
* Vim
* XCode
* Eclipise


Version Control:
* Git
* Github
* Gitlab
* Gerrit


### Build & Unit Testing:

Continuous Integration tools:
* Jenkins 
* Maven 
* Ant 
* Gradle 
* CircleCI

### Release & Deployment

Continous Deployment to different environment:
* RD Integration Tests Environment
* QA Environment
* Production Environment

為了確保部署軟體的功能一致，「持續部署」必須採用同一個包裝好的套件(package)，

另一個達到「持續部署」的重要手段是要針對軟體可以客制化的功能，將其組態/設定外部化(configuraiton externalization)，簡單點講：就是不要將設定(settings)寫死(hard-coded)在程式碼裡面。


Infrastructure as a Service
* Amazon Web Services 
* Rackspace
* Cloud Foundry
* Azure
* OpenStack

Virtualization Platforms
* VMware 
* KVM
* Xen
* VirtualBox 
* Vagrant 

Containerization Tools
* LXC
* Solaris Containers
* Docker 

Linux OS Installation
* Kickstart 
* Cobbler 
* MAAS


Configuration Management
* Puppet + MCollective 
* Chef
* SaltStack
* Ansible
* Ubuntu Juju

Application Deployment
* Fabric
* Capistrano 


### Continous Delivery

「持續交付」是將新的特性儘快交付到最終使用者(end-user)的手中。

盡快收集使用者回饋，及時及持續修正Plan & Business Model Canvas.



Other Useful Tools
------------------

refer:
- https://medium.com/@arashsami/a-short-list-of-devops-tools-dd786ce32da8

Application Servers:

	1. JBoss
	2. Tomcat
	3. Jetty 
	4. Glassfish
	5. Websphere
	6. Weblogic

Web Servers

	1. nginx 
	2. Apache 
	3. IIS

Queues, Caches, etc.

	1. ActiveMQ
	2. RabbitMQ
	3. memcache
	4. varnish
	5. squid

Databases

	1. Percona Server 
	2. MySQL
	3. PostgreSQL
	4. OpenLDAP
	5. MongoDB
	6. Cassandra
	7. Redis 
	8. Oracle
	9. MS SQL

Monitoring, Alerting, and Trending

	1. New Relic 
	2. Nagios 
	3. Icinga
	4. Graphite
	5. Ganglia
	6. Cacti 
	7. PagerDuty  j
	8. Sensu

Logging
	1. PaperTrail 
	2. Logstash
	3. Loggly
	4. Splunk
	5. SumoLogic

Process Supervisors

	1. Monit 
	2. runit
	3. Supervisor
	4. god
	5. Blue Pill
	6. Upstart
	7. systemd

Security

	1. Snorby Threat Stack 
	2. Tripwire
	3. Snort

Miscellaneous Tools

	1. Multihost SSH Wrapper 
	2. Code Climate
	3. iPerf 
	4. lldpd 
	5. HipChat

