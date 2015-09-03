Unit Test
=========

refer:
- https://developer.android.com/training/testing.html
- https://stuff.mit.edu/afs/sipb/project/android/docs/tools/testing/activity_test.html

It's better to seperate Unit Testing and UI Testing to different packages.  


Basic Usage
------------

#### Create a test files

Activity tests are written in a structured way. Make sure to put your tests in a separate package, distinct from the code under test.

To create a new test case in Eclipse:

- In the Package Explorer, right-click on the /src directory and select `New > Folder > Java Folder`, and Set the Name field to `androidTest.java` <br>
- Right-click on the new java Folder and select `New > Package`.
  and Set the Name field to `tests` <br>
- Right-click on the test package you created, and select `New > Class`.
  and Set the Name field to <your_app_activity_name>Test (for example, MyFirstTestActivityTest) and click Finish.<br>


```
sourceSets {
        main {
            manifest.srcFile 'AndroidManifest.xml'
            java.srcDirs = ['src']
            resources.srcDirs = ['src']
            aidl.srcDirs = ['src']
            renderscript.srcDirs = ['src']
            res.srcDirs = ['res']
            assets.srcDirs = ['assets']
        }

        // Move the tests to tests/java, tests/res, etc...
        //instrumentTest.setRoot('tests')
        androidTest.setRoot('tests')
```

#### Set Up Your Test Fixture

##### 1. modify your test case class to extend one of the sub-classes of `TestCase`.

refer: http://stackoverflow.com/questions/2047261/using-android-test-framework

|               sub-class                              | Usage |
| ---------------------------------------------------- | ------|
| TestCase                                             | Plain old JUnit test case. It can be extended to test utility classes that are not tied to the Android framework.|
| AndroidTestCase                                      | It extends JUnit’s TestCase. It’s a lighter testing class compared to ActivityTestCase. <br>It doesn’t need to launch an activity to run it. <br>Its getContext() method allows you to get an injected context if you need one. Since you can get a context from this class, you can inflate your UI objects to test their behaviors. |
| ActivityUnitTestCase<T extends Activity>             | (JVM)<br> your Activity will not be running in the normal system and will not participate in the normal interactions with other Activities or system/network resources. |
| ActivityInstrumentationTestCase2<T extends Activity> | (Physical Devise/Emulators)<br> 1. You can run any test method on the UI thread. <br> 2. You can inject custom Intents into your Activity.|
| ApplicationTestCase                                  | It provides testing for Application classes. It can be used to test the life cycle of an application.|
| ProviderTestCase2                                    | |
| ServiceTestCase                                      | |

**Hint:** You should create instrumented unit tests if your tests need access to instrumentation information (such as the target app's Context) or if they require the real implementation of an Android framework component (such as SharedPreferences object).
<br>

##### 2. Add public testing methods. Method name must start with *test*.

**(Hint)** Formal code style - test method name rules: `testMethod_testcase()`

**(Hint)** It is good practice to add a method (testPreconditions) to verify that the test fixture has been set up correctly,
and the objects that you want to test have been correctly instantiated or initialized.

**(Hint)** if use getAcivity(), make sure you have a corresponding entry in your manifest. Ex:
`<activity android:name=".MyActivity" ...`

#### Run Testing

1. Set up new testing configuration: `Run >> Edit Configurations... >> Add New Configuration:"Android Testing"`
2. run testing
3. check testing result





Instrumentation
---------------

refer:
- https://stuff.mit.edu/afs/sipb/project/android/docs/reference/android/app/Instrumentation.html
- http://www.top-q.co.il/android-automation-101/

 This object is natively to the Java language, but in Android it has the main role of controlling the life cycle of an application

 The instrumentation has an ability to run code before each one of these events. This ability is used to inject relevant test code and allow test automation.

![Instrumentation Concept](http://www.top-q.co.il/wp-content/uploads/2013/03/lifeCycle.png)
