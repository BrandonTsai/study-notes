Run Android Unit Testing via Command on Linux Server
====================================================

refer:
- http://developer.android.com/tools/testing/testing_otheride.html#RunTestsDevice
- [Manage android AVD by cmdline](http://developer.android.com/tools/devices/managing-avds-cmdline.html)
- [Using android AVD by cmdline](http://developer.android.com/tools/devices/emulator.html)
- [Install ABIs before create AVD](http://stackoverflow.com/questions/10019532/no-abi-error-when-creating-an-android-virtual-device)
- [vnc server](http://www.krizna.com/ubuntu/install-vnc-server-ubuntu-14-04/)




### build debug&test pkg

sudo gradle assembleDebug
sudo gradle assembleDebugAndroidTest

### uninstall old if pkg had already installed

adb uninstall com.quanta.vitalsign
adb uninstall com.quanta.vitalsign.test

### install debug&test pkg

adb -e install /tmp/vitalsign/app/build/outputs/apk/app-debug-unaligned.apk


### check what pkg had installed

adb shell ls data/data

### run testing


sudo adb shell am instrument -w com.quanta.vitalsign.test/android.support.test.runner.AndroidJUnitRunner
