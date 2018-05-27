# Firewall

- monitors and controls incoming and outgoing network traffic 
- based on predetermined security policy and rules.

refer: https://www.howtogeek.com/177621/the-beginners-guide-to-iptables-the-linux-firewall/


## iptables


### Types of Chains

- **INPUT** : control incoming connections.
- **FORWARD** : control incoming connections that aren’t actually being delivered locally.
- **OUTPUT** : control outgoing connections


```
$ sudo iptables -L -v
Chain INPUT (policy ACCEPT 339 packets, 32092 bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         

Chain OUTPUT (policy ACCEPT 260 packets, 24609 bytes)
 pkts bytes target     prot opt in     out     source               destination    
```


### Behavior and Responses

- **Accept** : Allow the connection.
- **Drop** : Drop the connection, act like it never happened.
- **Reject** : Don’t allow the connection, but send back an error. 


### Policy 

- default rule for all source.
- declare what do you want iptables to do if the connection doesn’t match any existing rules?

```
$ sudo iptables --policy INPUT ACCEPT
$ sudo iptables --policy OUTPUT ACCEPT
$ sudo iptables --policy FORWARD DROP
```

### Add Rule for Specific Connections

single source:
```
iptables -A INPUT -s 10.10.10.10 -j REJECT
```

range of source:
```
iptables -A INPUT -s 10.10.10.0/24 -j REJECT
iptables -A FORWARD -s 10.10.10.0/24 -j ACCEPT
```

Connections of a specific port
```
iptables -A INPUT -p tcp --dport ssh -s 10.10.10.10 -j DROP
iptables -A INPUT -p tcp --dport ssh -j DROP
```