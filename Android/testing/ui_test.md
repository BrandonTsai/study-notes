UI Testing
==========

Espresso
---------

refer: https://developer.android.com/training/testing/ui-testing/espresso-testing.html


Why Espresso:
- simulate user interactions within a single target app.
- able to simulate a user flow across multiple activities in the target app

Before you begin using Espresso, you must:

#### Install the Android Testing Support Library. <br>
  `Tools >> Android >> SDK Manager >> `

#### Update *build.gradle* file:
- Specify your Android testing dependencies. In order for the Android Plug-in for Gradle to correctly build and run your Espresso tests, you must specify the following libraries in the build.gradle file of your Android app module:
```
dependencies {
    <buildtype>Compile 'com.android.support.test:runner:0.3'
    <buildtype>Compile 'com.android.support.test:rules:0.3'
    <buildtype>Compile 'com.android.support.test.espresso:espresso-core:2.2'
    <buildtype>Compile 'com.android.support.test.uiautomator:uiautomator-v18:2.1.1'
}
```
for example:
```
dependencies {
    debugCompile 'com.android.support.test:runner:0.3'
    debugCompile 'com.android.support.test:rules:0.3'
    debugCompile 'com.android.support.test.espresso:espresso-core:2.2'
    debugCompile 'com.android.support.test.uiautomator:uiautomator-v18:2.1.1'
}
```
- The Espresso testing framework is an instrumentation-based API and works with the [AndroidJUnitRunner](https://developer.android.com/reference/android/support/test/runner/AndroidJUnitRunner.html) test runner. So we also need to set up the testInstrumentationRunner:<br>
```
android {
    defaultConfig {
        testInstrumentationRunner "android.support.test.runner.AndroidJUnitRunner"
      }
}
```

- use jcenter as repositories:
```
repositories {
    jcenter()
}
```

#### Turn off animations on your test device.

Leaving system animations turned on in the test device might cause unexpected results or may lead your test to fail. Turn off animations from Settings by opening Developing Options and turning all the following options off:
```
       Window animation scale
       Transition animation scale
       Animator duration scale
```

#### Using Espresso with ActivityInstrumentationTestCase2.

**Hint:** the new test package must under `app/src/androidTest/java/`, otherwise, AndroidJUnitRunner can not find the testing set.


Example:
```java
public class VitalSignTest extends ActivityInstrumentationTestCase2<VitalSign> {

	private VitalSign mVitalSign;

	public VitalSignTest(){
		super(VitalSign.class);
	}

	@OverrideonView(withId(R.id.my_view))            // withId(R.id.my_view) is a ViewMatcher
        .perform(click())               // click() is a ViewAction
        .check(matches(isDisplayed()))
	protected void setUp() throws Exception{
		super.setUp();
		injectInstrumentation(InstrumentationRegistry.getInstrumentation());
		mVitalSign = getActivity();
	}

  public void test_temperature_abnormal_input(){

		onView(withId(R.id.vitalsign_temperature_input))
				.perform(replaceText("5"), pressKey(KeyEvent.KEYCODE_ENTER), closeSoftKeyboard());

		//verify that the wrong value does not clean
		onView(withId(R.id.vitalsign_temperature_input))
				.check(matches(withText("5")));

		// verify the text color should change to 'R.color.value_abnormal'
		EditText temperature = (EditText) mVitalSign.findViewById(R.id.vitalsign_temperature_input);
		assertEquals(mVitalSign.getResources().getColorStateList(R.color.value_abnormal), temperature.getTextColors());

	}

}
```

Explain:

**Accessing UI Components:**
*onView(Matcher<View> viewMatcher):* access UI component of an Activity

```java
onView(withText("Sign-in"));
onView(withId(R.id.button_signin));
```

*onData():* AdapterView Control



**Performing Actions**
*perform(ViewAction... viewActions):*

viewActions:
- click()
- typeText("String")/ReplaceText("String")/clearText()...
- pressKey(int keyCode)
- ScrollTo()


**Verifying Results**
Use the ViewAssertions methods to check that the UI reflects the expected state or behavior, after these user interactions are performed.

- doesNotExist()
- matches(Matcher<? super View> viewMatcher), refer: http://developer.android.com/reference/android/support/test/espresso/matcher/ViewMatchers.html
- selectedDescendantsMatch(Matcher<View> selector, Matcher<View> matcher)


*Reference*:
- https://developer.android.com/training/testing/ui-testing/espresso-testing.html
- https://developer.android.com/reference/android/support/test/espresso/Espresso.html#onView%28org.hamcrest.Matcher%3Candroid.view.View%3E%29
- https://code.google.com/p/android-test-kit/wiki/EspressoSamples


#### Run Espresso Tests on a Device or Emulator
To run Espresso tests, you must use the AndroidJUnitRunner class provided in the Android Testing Support Library as your default test runner.


then Run Testing to check the testing result.


UI Automator Viewer
-------------------

**Why UI Automator?**
provides a UiDevice class to access and perform operations on the device on which the target app is running. such as:

- Change the device rotation
- Press the Back, Home, or Menu buttons
- Open the notification shade
- Take a screenshot of the current window

please refer:
- http://developer.android.com/tools/testing-support-library/index.html#UIAutomator
