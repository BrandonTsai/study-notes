#!/bin/bash -ex
cat $1 | xargs -i adb shell {}
