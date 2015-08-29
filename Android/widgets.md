Android Widgets
================

Widget Development:
refer:
- https://developer.android.com/guide/topics/appwidgets/index.html

How Launcher Manage Widgets?
- http://blog.csdn.net/thl789/article/details/7893292
- http://www.cnblogs.com/mythou/p/3256212.html
- http://blog.csdn.net/wdaming1986/article/details/8478533


How to add/remove widget to your app:
- https://developer.android.com/guide/topics/appwidgets/host.html
- http://coderender.blogspot.tw/2012/01/hosting-android-widgets-my.html
- http://edward.msize.tw/2010/11/androidappwidget-by_14.html


App Widgets are miniature application views that can be embedded in other applications (such as the Home screen) and receive periodic updates.


Steps:
* Adding the AppWidgetProviderInfo Metadata
* Creating the App Widget Layout
* Add the AppWidgetProvider
  * Using App Widgets with Collections
*
  * Setting a Preview Image
* Creating an App Widget Configuration Activity (Optional)


Adding the AppWidgetProviderInfo Metadata
--------------------------------------------

- Defines the essential qualities of an App Widget
- Create an XML resource in the project's **res/xml/** folder. via:
  `New >> Widget >> App Widget`

```xml
<?xml version="1.0" encoding="utf-8"?>
<appwidget-provider xmlns:android="http://schemas.android.com/apk/res/android"
                    android:minWidth="250dp"
                    android:minHeight="180dp"
                    android:updatePeriodMillis="5000"
                    android:previewImage="@drawable/example_appwidget_preview"
                    android:initialLayout="@layout/jpapp_widget"
                    android:widgetCategory="home_screen"
                    android:initialKeyguardLayout="@layout/jpapp_widget">
</appwidget-provider>
```

Creating the App Widget Layout
------------------------------

`/res/layout/jpapp_widget.xml` :

```xml
<RelativeLayout xmlns:android="http://schemas.android.com/apk/res/android"
                android:layout_width="250dp"
                android:layout_height="180dp"
                android:padding="@dimen/widget_margin"
                android:background="#bed9dd">

    <LinearLayout
        android:orientation="vertical"
        android:layout_width="match_parent"
        android:layout_height="match_parent">

        <LinearLayout
            android:orientation="horizontal"
            android:layout_width="match_parent"
            android:layout_height="wrap_content"
            android:background="#556371"
            android:padding="10dp">

            <TextView
                android:layout_width="wrap_content"
                android:layout_height="wrap_content"
                android:textAppearance="?android:attr/textAppearanceLarge"
                android:text="DrugPanda"
                android:id="@+id/textView6"
                android:textColor="#ffffff"/>
        </LinearLayout>

        <ListView
            android:layout_width="wrap_content"
            android:layout_height="wrap_content"
            android:id="@+id/listView5"/>
    </LinearLayout>
</RelativeLayout>
```


Add the AppWidgetProvider Class
--------------------------------
