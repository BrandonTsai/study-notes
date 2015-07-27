Android Basic Concept
=====================



Life Cycle
-----------

refer:
- http://developer.android.com/reference/android/app/Activity.html

### Activity stack
Activities in the system are managed as an **activity stack**.
- When a new activity is started, it is placed on the top of the stack and becomes the running activity
- The previous activity always remains below it in the stack, and will not come to the foreground again until the new activity exits.


### An Activity lifecycle

![http://developer.android.com/images/activity_lifecycle.png](http://developer.android.com/images/activity_lifecycle.png)

#### States
- **launched**: when the activity is first created.
- **running**: an activity in the foreground of the screen (at the top of the stack)
- **paused**: lost focus but is still visible (that is, a new non-full-sized or transparent activity has focus on top of your activity).
- **stopped**: completely obscured by another activity and no longer visible.
- **destoryed**: someone called finish() on it, or because the system is temporarily destroying this instance of the activity to save space.


#### Three key loops within activity

- The **entire lifetime** of an activity happens between the first call to onCreate(Bundle) through to a single final call to onDestroy(). An activity will do all setup of "global" state in onCreate(), and release all remaining resources in onDestroy(). For example, if it has a thread running in the background to download data from the network, it may create that thread in onCreate() and then stop the thread in onDestroy().
- The **visible lifetime** of an activity happens between a call to onStart() until a corresponding call to onStop(). During this time the user can see the activity on-screen, though it may not be in the foreground and interacting with the user. Between these two methods you can maintain resources that are needed to show the activity to the user. For example, you can register a BroadcastReceiver in onStart() to monitor for changes that impact your UI, and unregister it in onStop() when the user no longer sees what you are displaying. The onStart() and onStop() methods can be called multiple times, as the activity becomes visible and hidden to the user.
- The **foreground lifetime** of an activity happens between a call to onResume() until a corresponding call to onPause(). During this time the activity is in front of all other activities and interacting with the user. An activity can frequently go between the resumed and paused states -- for example when the device goes to sleep, when an activity result is delivered, when a new intent is delivered -- so the code in these methods should be fairly lightweight.
