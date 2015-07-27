ListView Adapter
================

There are four type adapter,  

please refer:
- http://codex.wiki/post/124507-478/
- http://blog.csdn.net/shakespeare001/article/details/7926783


Array Adapter
-------------

Simple Adapter
---------------

Base Adapter
------------

Steps:
1. Implement myadapter_layout.xml.
2. Implement MyAdapter Class,
  - init each item's layout at getView() function.
  - Implemet AddItem() and DelItem() function.
    Remember call notifyDataSetChanged() after add/delete item;
4. At Activity onCreate() function, assign MyAdapter as ListView's adapter.


#### without ViewHolder Pattern:

Always create a new view object when getView() is called.


```java

public class TestList1 extends TestListBaseActivity {

	private final static String TAG="List1";

	public ListAdapter1 myadapter;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_test_list1);

		// init ListView
		ListView ls = (ListView) findViewById(R.id.listView1);
		myadapter = new ListAdapter1(TestList1.this);
		ls.setAdapter(myadapter);
		Log.d(TAG, "update List1 adapter");

		// init Add item button
		Button btnAddItem = (Button) findViewById(R.id.btn_add_list1_item);
		btnAddItem.setOnClickListener(new AddListItem());

	}


	class AddListItem implements View.OnClickListener {

		@Override
		public void onClick(View v) {
			HashMap<String,String> item = new HashMap<>();
			item.put("name", "test item " + myadapter.items.size());
			item.put("price", "");
			item.put("type", "0");
			myadapter.items.add(item);
			myadapter.notifyDataSetChanged();
			Log.d(TAG, "Add new item");
		}
	}


	class DelListItem implements View.OnClickListener {

		int id;

		public DelListItem(int id){
			this.id = id;
		}

		@Override
		public void onClick(View v) {
			Log.d(TAG, "Delete item:" + id );
			myadapter.items.remove(id);
			myadapter.notifyDataSetChanged();
		}
	}


	class ListAdapter1 extends BaseAdapter {
		private LayoutInflater myInflater;
		public ArrayList<HashMap<String,String>> items = new ArrayList<>();

        public ListAdapter1(Context c){
            myInflater = LayoutInflater.from(c);
        }

		@Override
		public int getCount() {
			return items.size();
		}

		@Override
		public Object getItem(int position) {
			return items.get(position);
		}

		@Override
		public long getItemId(int position) {
			return position;
		}

		@Override
		public View getView(final int position, View convertView, ViewGroup parent) {
			Log.d(TAG, "position: " + position);
			convertView = myInflater.inflate(R.layout.listadapter1_item,parent,false);


			//init title
			TextView title = (TextView) convertView.findViewById(R.id.tv_listitem_title);
			title.setText("Item "+ position);


			// init name EditText
			EditText name = (EditText) convertView.findViewById(R.id.et_list1_name);
			name.setText(items.get(position).get("name"));
			name.addTextChangedListener(new TextWatcher() {
				@Override
				public void beforeTextChanged(CharSequence s, int start, int count, int after) {
				}

				@Override
				public void onTextChanged(CharSequence s, int start, int before, int count) {
				}

				@Override
				public void afterTextChanged(Editable s) {
					Log.d(TAG, "TextChanged postion" + position);
					items.get(position).put("name", s.toString());
				}
			});


			// init name EditText
			EditText price = (EditText) convertView.findViewById(R.id.et_list1_price);
			price.setText(items.get(position).get("price"));
			price.addTextChangedListener(new TextWatcher() {
				@Override
				public void beforeTextChanged(CharSequence s, int start, int count, int after) {
				}

				@Override
				public void onTextChanged(CharSequence s, int start, int before, int count) {
				}

				@Override
				public void afterTextChanged(Editable s) {
					Log.d(TAG, "TextChanged postion" + position);
					items.get(position).put("price", s.toString());
				}
			});

      // init spinner
			final Spinner spinner = (Spinner) convertView.findViewById(R.id.spn_list1_item);
			String[] mItems = getResources().getStringArray(R.array.listview1_spinner1);
			ArrayAdapter<String> adapter = new ArrayAdapter<String>(TestList1.this,
					android.R.layout.simple_spinner_item,mItems);
			spinner.setAdapter(adapter);
			spinner.setId(position);
			spinner.setSelection(Integer.valueOf(items.get(position).get("type")));
			Log.d(TAG, "(item " + position + ")  set Spinner selection: " + items.get(position).get("type"));
			spinner.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
				@Override
				public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
					items.get(parent.getId()).put("type", String.valueOf(spinner.getSelectedItemPosition()));
					Log.d(TAG, "(item " + parent.getId() + ") update Spinner selection: " + spinner.getSelectedItemPosition());
				}

				@Override
				public void onNothingSelected(AdapterView<?> parent) {

				}
			});


            // init Button
            Button button = (Button) convertView.findViewById(R.id.btn_del_list1_item);
            button.setOnClickListener(new DelListItem(position));

			return convertView;

		}
	}
}
```


#### with ViewHolder patthen:
Because Android will cache the view outside the visible region at Recycler,
we can reuse the view object instead create new one via ViewHold Pattern.

If any inner class and final variable is used (usually for set up Listener),
it might cause some issue when using ViewHolder Pattern.

please refer:
- http://www.cnblogs.com/xiaowenji/archive/2010/12/08/1900579.html


```java
public class TestList2 extends TestListBaseActivity {


	private static final String TAG="List2";


	private MyAdapter2 myadapter;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_test_list2);

		// init ListView
		ListView ls = (ListView) findViewById(R.id.listView2);
		myadapter = new MyAdapter2(TestList2.this);
		ls.setAdapter(myadapter);
		Log.d(TAG, "update List2 adapter");

		// init Add item button
		Button btnAddItem = (Button) findViewById(R.id.btn_add_list2_item);
		btnAddItem.setOnClickListener(new AddListItem());

	}


	class AddListItem implements View.OnClickListener {

		@Override
		public void onClick(View v) {
			String content = "test " + myadapter.getCount();
			myadapter.addItem(content);
		}
	}


	class DelListItem implements View.OnClickListener {

		int id;

		public DelListItem(int id){
			this.id = id ;
		}

		@Override
		public void onClick(View v) {
			myadapter.deleteItem(id);
		}
	}


	class MyViewTag {
		TextView title;
		EditText name;
		EditText price;
		Spinner  spn;
		Button   delete;

		public NameTextWatcher nameTextWatcher = null;

		public MyViewTag(TextView title,
		                 EditText name,
						 EditText price,
						 Spinner  spn,
						 Button   delete) {
			this.title = title;
			this.name = name;
			this.price = price;
			this.spn = spn;
			this.delete = delete;

		}

	}

	class NameTextWatcher implements TextWatcher {
		public int position;


		public NameTextWatcher (int position){
			this.position = position;
		}

		@Override
		public void beforeTextChanged(CharSequence s, int start, int count, int after) {

		}

		@Override
		public void onTextChanged(CharSequence s, int start, int before, int count) {

		}

		@Override
		public void afterTextChanged(Editable s) {
			Log.d(TAG,"afterTextChanged position" + position + ":" +s.toString());
			myadapter.items.set(position, s.toString());
		}
	}

	protected class MyAdapter2 extends BaseAdapter {

		private LayoutInflater myInflater;
		public ArrayList<String> items = new ArrayList<>();


		public MyAdapter2(Context c){
			this.myInflater = LayoutInflater.from(c);
		}


		public void addItem(String s){
			items.add(s);
			Log.d(TAG, "Add item:" + s);
			notifyDataSetChanged();
		}

		public void deleteItem(int position){
			items.remove(position);
			Log.d(TAG, "Delete item:" + String.valueOf(position));
			notifyDataSetChanged();
		}

		@Override
		public int getCount() {
			return items.size();
		}

		@Override
		public Object getItem(int position) {
			return items.get(position);
		}

		@Override
		public long getItemId(int position) {
			return position;
		}

		@Override
		public View getView(final int position, View convertView, ViewGroup parent) {

			MyViewTag viewTag;
			if (convertView == null) {
				Log.d("ListView", "(TY) new viewTag??" + position);
				convertView = myInflater.inflate(R.layout.listadapter2_item,null);
				viewTag = new MyViewTag(
						(TextView) convertView.findViewById(R.id.tv_list2_item_title),
						(EditText) convertView.findViewById(R.id.et_list2_name),
						(EditText) convertView.findViewById(R.id.et_list2_price),
						(Spinner) convertView.findViewById(R.id.spn_list2_item),
						(Button) convertView.findViewById(R.id.btn_del_list2_item));
				convertView.setTag(viewTag);

			} else {
				Log.d("ListView", "(TY) recycle ??" + position);
				viewTag = (MyViewTag) convertView.getTag();
			}

			Log.d(TAG, "position: " + position);
			//init title
			viewTag.title.setText("Item " + position);
			viewTag.title.setId(position);


			// init EditText
			if (viewTag.nameTextWatcher != null) {
				viewTag.nameTextWatcher.position = position;
			} else {
				viewTag.nameTextWatcher = new NameTextWatcher(position);
				viewTag.name.addTextChangedListener(viewTag.nameTextWatcher);
			}
			viewTag.name.setText(items.get(position));
			viewTag.name.setId(position);


			viewTag.price.setId(position);

			// init spinner
			viewTag.spn.setId(position);
			String[] mItems = getResources().getStringArray(R.array.listview1_spinner1);
			ArrayAdapter<String> adapter = new ArrayAdapter<String>(TestList2.this,
					android.R.layout.simple_spinner_item,mItems);
			viewTag.spn.setAdapter(adapter);


			// init Button
			viewTag.delete.setId(position);
			viewTag.delete.setOnClickListener(new DelListItem(position));


			return convertView;
		}

	}

}

```




#### setListViewHeightBasedOnChildren(ListView listView)

When a ListView is putted inside a ScrollView.
**(Don't do that! ListView is scrollable, or put linearLayout in ScrollView)**
We must reset ListView's Height based on the Children.

the basic solution is:

```java
public void setListViewHeightBasedOnChildren(ListView listView) {

    if(listView == null) return;
    ListAdapter listAdapter = listView.getAdapter();
    if (listAdapter == null) {
        // pre-condition
        return;
    }

    int totalHeight = 0;
    for (int i = 0; i < listAdapter.getCount(); i++) {
        View listItem = listAdapter.getView(i, null, listView);
        listItem.measure(0, 0);
        totalHeight += listItem.getMeasuredHeight();
    }

    ViewGroup.LayoutParams params = listView.getLayoutParams();
    params.height = totalHeight + (listView.getDividerHeight() * (listAdapter.getCount() - 1));
    listView.setLayoutParams(params);

}
```

but above solution may cause some memory issue when ViewHolder patthen is used in getView() method.

Implement the getViewHight(int position) method to get the each child's height instead.

```java
protected int getViewHight(final int position){
    myInflater = LayoutInflater.from(myActivity);
		View convertView = myInflater.inflate(R.layout.my_adapter_item, null);

    // handle the hided views
		RelativeLayout otherLayout = (RelativeLayout) convertView.findViewById(R.id.my_adapter_item_hide_layout);
		if (list.get(position).get("other") != null) {
			otherLayout.setVisibility(View.VISIBLE);
		}

		convertView.measure(0,0);
		int height = convertView.getMeasuredHeight();
		convertView = null; //for release memory.

		return height;
}


public void setListViewHeightBasedOnChildren(ListView listView) {
	    if(listView == null) return;

	    ListAdapter listAdapter = listView.getAdapter();
	    if (listAdapter == null) {
	        // pre-condition
	        return;
	    }

		int totalHeight = 0;
		for (int i = 0; i < listAdapter.getCount(); i++){
			totalHeight += getViewHeight(i);
		}
		//int totalHeight = this.viewHigh * listAdapter.getCount();

	    ViewGroup.LayoutParams params = listView.getLayoutParams();
	    params.height = totalHeight + (listView.getDividerHeight() * (listAdapter.getCount() - 1));
	    listView.setLayoutParams(params);
	}
```

At Android 4.4.2, when the ListView's Height is changed, it may reuse convertView.
If there are any issues (such as Listener setting) when reusing convertView, we can use following trick before calling setListViewHeightBasedOnChildren() to force ListView always to create new convertView instead of reuse convertView.

```java
// a trick to do not reuse convertView when ListView's height changed.
ListViewTypeVolumeAdapter listAdapter = new ListViewTypeVolumeAdapter(vitalSignBase, list, category, listView, focus);
		listView.setAdapter(listAdapter);
```

Cursor Adapter
---------------
