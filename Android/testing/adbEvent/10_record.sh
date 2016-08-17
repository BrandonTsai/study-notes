#!/bin/sh
#sudo apt-get install moreutils
adb shell getevent | ts "%Y-%m-%d %H:%M:%.S" > event.log

