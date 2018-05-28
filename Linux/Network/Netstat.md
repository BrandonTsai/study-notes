# Netstat


Displays various network related information such as network connections, routing tables, interface statistics, masquerade connections, multicast memberships etc.,

### Usage:
List All Ports (both listening and non listening ports)
```
netstat -a
```

List Sockets and Ports which are in Listening State
```
netstat -l
```

Display PID and program names in netstat output
```
netstat -p
```

Find out on which port a program is running
```
netstat -ap | grep ssh
```

Find out which process is using a particular port:
```
netstat -an | grep ':80'
```

Check current routing table:
```
$ netstat -rn

Kernel IP routing table
Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
0.0.0.0         172.31.0.1      0.0.0.0         UG        0 0          0 eth0
169.254.169.254 0.0.0.0         255.255.255.255 UH        0 0          0 eth0
172.31.0.0      0.0.0.0         255.255.240.0   U         0 0          0 eth0

```

>> -n option, which will only show numerical addresses rather than performing any sort of name resolution.
