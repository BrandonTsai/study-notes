Monkey Testing
==============

**Why Monkey?**
- The Monkey is a command-line tool that runs on your emulator or device and generates pseudo-random streams of user events such as clicks, touches, or gestures, as well as a number of system-level events.
- is suitable for stress testing.

**Running Result:**
- If your application crashes or receives any sort of unhandled exception, the Monkey will stop and report the error.
- If your application generates an application not responding error, the Monkey will stop and report the error.

#### Basic Usage

```shell
$ sudo adb shell monkey -p com.quanta.vitalsign -v 50
:Monkey: seed=1438888806935 count=50
:AllowPackage: com.quanta.vitalsign
:IncludeCategory: android.intent.category.LAUNCHER
:IncludeCategory: android.intent.category.MONKEY
// Event percentages:
//   0: 15.0%
//   1: 10.0%
//   2: 2.0%
//   3: 15.0%
//   4: -0.0%
//   5: 25.0%
//   6: 15.0%
//   7: 2.0%
//   8: 2.0%
//   9: 1.0%
//   10: 13.0%
:Switch: #Intent;action=android.intent.action.MAIN;category=android.intent.category.LAUNCHER;launchFlags=0x10200000;component=com.quanta.vitalsign/.Login;end
    // Allowing start of Intent { act=android.intent.action.MAIN cat=[android.intent.category.LAUNCHER] cmp=com.quanta.vitalsign/.Login } in package com.quanta.vitalsign
:Sending Touch (ACTION_DOWN): 0:(347.0,300.0)
:Sending Touch (ACTION_UP): 0:(350.37814,298.497)
:Sending Trackball (ACTION_MOVE): 0:(2.0,2.0)
:Sending Trackball (ACTION_UP): 0:(0.0,0.0)
:Switch: #Intent;action=android.intent.action.MAIN;category=android.intent.category.LAUNCHER;launchFlags=0x10200000;component=com.quanta.vitalsign/.Login;end
    // Allowing start of Intent { act=android.intent.action.MAIN cat=[android.intent.category.LAUNCHER] cmp=com.quanta.vitalsign/.Login } in package com.quanta.vitalsign
:Sending Flip keyboardOpen=false
:Sending Trackball (ACTION_MOVE): 0:(-5.0,-1.0)
:Sending Trackball (ACTION_UP): 0:(0.0,0.0)
:Sending Touch (ACTION_DOWN): 0:(508.0,919.0)
:Sending Touch (ACTION_UP): 0:(522.2911,917.87726)
:Sending Touch (ACTION_DOWN): 0:(612.0,398.0)
:Sending Touch (ACTION_UP): 0:(630.60333,408.68585)
:Sending Touch (ACTION_DOWN): 0:(457.0,62.0)
:Sending Touch (ACTION_UP): 0:(458.8939,65.03747)
:Sending Trackball (ACTION_MOVE): 0:(-2.0,-2.0)
Events injected: 50
:Sending rotation degree=0, persist=false
:Dropped: keys=0 pointers=0 trackballs=0 flips=0 rotations=0
## Network stats: elapsed time=180ms (0ms mobile, 0ms wifi, 180ms not connected)
// Monkey finished

```

#### monkey runner
please refer: http://developer.android.com/tools/help/monkeyrunner_concepts.html

Features:

- **Multiple device control:** The monkeyrunner API can apply one or more test suites across multiple devices or emulators. You can physically attach all the devices or start up all the emulators configuration programmatically at once, connect to each one in turn programmatically, run one or more tests, and then shut down the emulator.
- **Functional testing:** monkeyrunner can run an automated start-to-finish test of an Android application. You provide input values with keystrokes or touch events, and view the results as screenshots.
- **Regression testing** - monkeyrunner can test application stability by running an application and comparing its output screenshots to a set of screenshots that are known to be correct.
- **Extensible automation** - Since monkeyrunner is an API toolkit, you can develop an entire system of Python-based modules and programs for controlling Android devices.
