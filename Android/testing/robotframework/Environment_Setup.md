# Testing Environment Setup

## System Requirement

- OS: ubuntu 14.04.4 desktop amd64
- One physical QF3 Device connected
- One physical smart phone connected


## Basic package

```bash
sudo apt-get install python-pip git unzip
export LC_ALL=C
```

## Firefox:

Because selenium can not work on firefox version over 47

Please download and install old version firefox (version 46.0.1 is fine)

You can find the deb file at
https://sourceforge.net/projects/ubuntuzilla/files/mozilla/apt/pool/main/f/firefox-mozilla-build/


## Chrome:

#### Install Chrome:
https://www.google.com/intl/en-US/chrome/browser/desktop/index.html


#### Install ChromeDriver:


Please download latest version chrome driver from
http://chromedriver.storage.googleapis.com/index.html
<br> and then put the chromedriver file under `/usr/bin/`

## Robot Framework

```bash
sudo pip install robotframework
```

## Selenium

#### Install Selenium2Library

Please install my Selenium2Library repo:

```bash
git clone https://github.com/BrandonTsai/Selenium2Library.git
cd Selenium2Library
sudo python setup.py install
```


#### (Optional) Run Selenium Server as Service

Please refer: http://pietervogelaar.nl/ubuntu-14-04-install-selenium-as-service-headless

## Appium Setup

#### Install Appium

```bash
sudo apt-get install -y python-software-properties python g++ make
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 68576280
sudo apt-add-repository "deb https://deb.nodesource.com/node_6.x $(lsb_release -sc) main"
sudo apt-get update
sudo apt-get install nodejs

sudo npm install -g appium wd

sudo pip install Appium-Python-Client
```

#### Install AppliumLibrary

Please install my AppiumLibrary

```bash
git clone https://github.com/BrandonTsai/robotframework-appiumlibrary.git
cd robotframework-appiumlibrary
sudo python setup.py install
```


#### Run Appium as Service

```bash
sudo mkdir -p /var/log/appium
sudo chmod a+w /var/log/appium
```

vi /etc/init.d/appium

```bash
#!/bin/bash

case "${1:-''}" in
    'start')
        if test -f /tmp/appium.pid
        then
            echo "Appium is already running."
        else
            export DISPLAY=localhost:99.0
            appium > /var/log/appium/output.log 2> /var/log/appium/error.log &
            echo $! > /tmp/appium.pid
            echo "Starting Appium..."

            error=$?
            if test $error -gt 0
            then
                echo "${bon}Error $error! Couldn't start Appium!${boff}"
            fi
        fi
    ;;
    'stop')
        if test -f /tmp/appium.pid
        then
            echo "Stopping Appium..."
            PID=`cat /tmp/appium.pid`
            kill -3 $PID
            if kill -9 $PID ;
                then
                    sleep 2
                    test -f /tmp/appium.pid && rm -f /tmp/appium.pid
                else
                    echo "Appium could not be stopped..."
                fi
        else
            echo "Appium is not running."
        fi
        ;;
    'restart')
        if test -f /tmp/appium.pid
        then
            kill -HUP `cat /tmp/appium.pid`
            test -f /tmp/appium.pid && rm -f /tmp/appium.pid
            sleep 1
            export DISPLAY=localhost:99.0
            appium > /var/log/appium/output.log 2> /var/log/appium/error.log & echo $! > /tmp/appium.pid
            echo "Reload Appium..."
        else
            echo "Appium isn't running..."
        fi
        ;;
    *)      # no parameter specified
        echo "Usage: $SELF start|stop|restart"
        exit 1
    ;;
esac
```

then try to start the service

```bash
sudo chmod 755 /etc/init.d/appium
sudo /etc/init.d/appium start
```

check appium is running or not

```bash
ps aux | grep appium
```
