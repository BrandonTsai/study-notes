Data Type
=========

Integer
-------

### to String
```java
String.valueof(myInteger);
```


### compare
```java
Integer a = 10;
Integer b = 20;

if (a == b){
	System.out.printf("equal");
}else{
	System.out.printf(" not equal");
}
```


String
------

### to Integer
```java
Integer.valueof(myString);
```

### to Array
```java
String items = "item1,item2"
String[] itemArray = items.split(",");
```

### compare

```java
String a = "abc";
String b = "abc";
String c = "abc";

if (a == b){
	System.out.printf("a equal to b\n");
}

if (a.equals(c)){
	System.out.printf("a equal to c\n");
}
```


Array
-----

refer:
- http://programming.im.ncnu.edu.tw/J_Chapter3.htm
- http://www.ewdna.com/2012/02/javaarray-to-string-string-to-array.html

### init

```java
String[] a1 = { 'item1', 'item2' };

## or

int[] a2; // x is a reference to int[]
a2 = new int[5];
for (int i = 0; i < a2.length; i++) {
     x[i] = i;
}

```

### to String

```java
String[] a1 = { 'item1', 'item2' };
String arrayString = Arrays.toString(a1);
```

### to ArrayList
```java
String[] a2 = { 'item1', 'item2' };

// init from array
ArrayList<String> list = new ArrayList<>(Arrays.asList(a2));
```

ArrayList
---------

ArrayList is a Resizable-array.

### init

```java
ArrayList<String> list1 = new ArrayList<String>();
```

### toString

```java
public static String ArrayList2String(ArrayList<String> list){
	// print ArrayList content
	String out = "[";
	for (String s: list){
		out += s;
		if (! s.equals(list.get(list.size()-1))){
			out += ",";
		}
	}
	out += "]";
	return out;
}
```

### Clone

```java
// clone ArrayList
ArrayList<String> list2 = (ArrayList<String>) list.clone();
System.out.printf(ArrayList2String(list2));
```

### Sort
```java
// sort ArrayList
list2.sort(null);
System.out.printf(ArrayList2String(list2));
```

or

```
Collections.sort()
```

HashMap
-------

Set
---



Json
-----
