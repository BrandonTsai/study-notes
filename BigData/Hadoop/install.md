Hadoop
======

Install Hadoop on Single Ubuntu 14.04 node 
------------------------------------------

refer:
- http://hadoop.apache.org/docs/r2.7.0/hadoop-project-dist/hadoop-common/SingleCluster.html

### Prefight

Install required packages
```bash
$ sudo apt-get install ssh rsync openjdk-7-jre openjdk-7-jdk 
$ java -version
java version "1.7.0_79"
OpenJDK Runtime Environment (IcedTea 2.5.5) (7u79-2.5.5-0ubuntu0.14.04.2)
OpenJDK 64-Bit Server VM (build 24.79-b02, mixed mode)
```

Set up Java:

```bash
$ export JAVA_HOME="/usr/lib/jvm/java-7-openjdk-amd64"
```

Download hadoop package

```bash
$ wget http://ftp.mirror.tw/pub/apache/hadoop/common/hadoop-2.7.0/hadoop-2.7.0.tar.gz
$ tar -xzvf hadoop-2.7.0.tar.gz 
$ cd hadoop-2.7.0
$ bin/hadoop
Usage: hadoop [--config confdir] [COMMAND | CLASSNAME]
  CLASSNAME            run the class named CLASSNAME
 or
  where COMMAND is one of:
  fs                   run a generic filesystem user client
  version              print the version
  jar <jar>            run a jar file
                       note: please use "yarn jar" to launch
                             YARN applications, not this command.
  checknative [-a|-h]  check native hadoop and compression libraries availability
  distcp <srcurl> <desturl> copy file or directories recursively
  archive -archiveName NAME -p <parent path> <src>* <dest> create a hadoop archive
  classpath            prints the class path needed to get the
  credential           interact with credential providers
                       Hadoop jar and the required libraries
  daemonlog            get/set the log level for each daemon
  trace                view and modify Hadoop tracing settings

Most commands print help when invoked w/o parameters.
```

Now you are ready to start your Hadoop cluster in one of the three supported modes:

* Local (Standalone) Mode
* Pseudo-Distributed Mode
* Fully-Distributed Mode



### Pseudo-Distributed Hadoop Environment

#### Configuration

etc/hadoop/core-site.xml:
```
<configuration>
    <property>
        <name>fs.defaultFS</name>
        <value>hdfs://localhost:9000</value>
    </property>
</configuration>
```

etc/hadoop/hdfs-site.xml:
```
<configuration>
    <property>
        <name>dfs.replication</name>
        <value>1</value>
    </property>
</configuration>
```

etc/hadoop/hadoop-env.sh:
```
export JAVA_HOME="/usr/lib/jvm/java-7-openjdk-amd64"
```

#### Setup passphraseless ssh

```
$ ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa
$ cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys
```

set up hadoop path to current $pwd
```
$ export HADOOP_PREFIX="$(pwd)"
$ export | grep HADOOP
declare -x HADOOP_PREFIX="/home/ubuntu/hadoop-2.7.0"
```

#### Execution

Format the filesystem:
```
$ bin/hdfs namenode -format
```

Start NameNode daemon and DataNode daemon:
```
$ sbin/start-dfs.sh
```
