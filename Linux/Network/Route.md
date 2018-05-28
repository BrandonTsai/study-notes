# Routing Concept

## Route Table
For a network router to know where to send packets of data it receives

Main entries if route table :
- **Destination IP address** : Represents the IP address of the destination. 

- **Gateway** : The IP address of the next router which decides how to further send an IP data gram received on its interface.

- **Flags** : Provides another set of vital information like destination IP address is a host address or a network address. Also, flags convey whether the Gateway is really a next router or a directly connected interface.

- **Network interface specs** : Some specification about the network interface the datagram should be passed for further transmission.

- **Metric** : The Metric field indicates the cost of a route. If multiple routes exist to a given destination network ID, the metric is used to decide which route is to be taken. The route with the lowest metric is the preferred route. 



## 'route' Command Usage

refer: https://linoxide.com/how-tos/add-static-route-linux/

### (1) Show route table

```
$ route -n

Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
0.0.0.0         172.31.0.1      0.0.0.0         UG    0      0        0 eth0
169.254.169.254 0.0.0.0         255.255.255.255 UH    0      0        0 eth0
172.31.0.0      0.0.0.0         255.255.240.0   U     0      0        0 eth0
```

-  -n option, which will only show numerical addresses rather than performing any sort of name resolution.
- The flags: 
    - *U*: suggests that the route is up 
    - *G*: suggests that the router is to a gateway (router). 
    - *H*: this is a route to a single host (and not a network) 


> Note: Other command to get route table:
>
> ```
> $ netstat -an
> ```
> ```
> $ ip route
> ```


### (2) Adds a route to the network

**route add -net <network_address> gw <gateway> <interface_name>** 
- to indicate the destination network we want to join. We must specify the mask of the network and the gateway to use.

```
route add -net 10.0.0.0/8 gw 192.168.1.1 eth1
```

**route add -host <host_IP_address> gw <gateway>**
- to indicate a specific host that we want to join

```
route add -host 10.0.0.10 gw 192.168.1.1 eth1
```
**Add Default route**
```
route add default gw 192.168.1.10
```

### (3) Deleting a route rule

**route del -net <network_address> gw <gateway> <interface_name>** 
- to delete a destination network from the routing table

### (4) Reject a route

**route  add -host <host_IP_address> reject** 
- to ban an IP address but it is still on the routing table.