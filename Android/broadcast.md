BroadCast
==========


```java
String OLA_BROATCAST_STRING = "OLA_ON_SERVICE_001";
Intent i = new Intent(OLA_BROATCAST_STRING);
i.putExtra("STR_PARAM1", "XXXX");
sendBroadcast(i);
```



```java
String OLA_BROATCAST_STRING = "OLA_ON_SERVICE_001";
IntentFilter mFilter01 = new IntentFilter(OLA_BROATCAST_STRING);
mReceiver01 = new mBroadcastReceiver(); //←實作一個BroadcastReceiver來篩選
registerReceiver(mReceiver01, mFilter01);
```


```java
unregisterReceiver(mReceiver01);
```
