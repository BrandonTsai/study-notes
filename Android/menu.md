Menu
====

refer:
- http://givemepass.blogspot.tw/2011/11/menu.html



### Method 1 : add static item on res/menu/menu_myactivity.xml


1. add three menu items on myactivity.xml:

```
<item android:id="@+id/menu_item1"
          android:title="list 1" />
    <item android:id="@+id/menu_item2"
          android:title="list 2" />
    <item android:id="@+id/menu_item3"
          android:title="list 3" />
```

2. Override **onCreateOptionsMenu()** and **onOptionsItemSelected()** at Myactivity.java

```java
@Override
public boolean onCreateOptionsMenu(Menu menu) {
    // Inflate the menu; this adds items to the action bar if it is present.
    getMenuInflater().inflate(R.menu.menu_main, menu);
    return true;
}

@Override
public boolean onOptionsItemSelected(MenuItem item) {
    // Handle action bar item clicks here. The action bar will
    // automatically handle clicks on the Home/Up button, so long
    // as you specify a parent activity in AndroidManifest.xml.
    int id = item.getItemId();
    int position = item.getOrder();

    // Go to different intent if item selected
    Intent it = null;
    switch (id){
        case R.id.menu_item1:
            Log.d(TAG, "select menu item " + position);
            it = new Intent(MainActivity.this, TestList1.class);
            startActivity(it);
            break;
        case R.id.menu_item2:
            Log.d(TAG, "select menu item "+ position);
            it = new Intent(MainActivity.this, TestList2.class);
            startActivity(it);
            break;
        case R.id.menu_item3:
            Log.d(TAG, "select menu item "+ position);
            it = new Intent(MainActivity.this, TestList3.class);
            startActivity(it);
            break;
    }

    //noinspection SimplifiableIfStatement
    if (id == R.id.action_settings) {
        return true;
    }

    return super.onOptionsItemSelected(item);
}

```

Sub Menu
--------


Munu Adapter
-----------
