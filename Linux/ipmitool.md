IPMItool
========

IPMI Introduction
-----------------


IPMI: A set of computer interface
that provides **out-of-band management** and monitoring capabilities of 
the host system's CPU, firmware (BIOS or UEFI) and operating system.

An IPMI sub-system consists of a main controller, called the **baseboard management controller (BMC)** and other management controllers distributed among different system modules that are referred to as satellite controllers. 


refer:
- http://en.wikipedia.org/wiki/Intelligent_Platform_Management_Interface


Install ipmitool and required kernal module.
-------------------------------------------

```bash
sudo apt-get install ipmitool
sudo modprobe ipmi_si
sudo modprobe ipmi_devintf
sudo modprobe ipmi_msghandler
```

Ipmitool Basic Usage Concept
----------------------

| Commands | Notes |
| -------- | ----- |
| lan      | manage lan channel, useful to set up BMC |
| chassis  | Get chassis status and set power state |
| power    | Shortcut to chassis power commands |
| sel      | Print System Event Log (SEL) |
| sdr      | Print Sensor Data Repository entries and readings |

BMC Management
--------------

the channel number of BMC is 1

get BMC setting:
```
ipmitool lan print 1
```

set static BMC ip address:
```
ipmitool lan set 1 ipsrc static
ipmitool lan set 1 ipaddr 10.3.3.123
ipmitool lan set 1 netmask 255.255.255.0
ipmitool lan set 1 defgw ipaddr 10.3.3.254
```

set BMC ip address from DHCP:
```
ipmitool lan set 1 ipsrc dhcp 
```


Power Management
----------------

```
ipmitool power status 
ipmitool power on
ipmitool power off
ipmitool power cycle
```


Server Identify Lights Out
-------------------------

```
ipmitool chassis identify
```

Monitoring Sensor Data
----------------------
```
ipmitool sdr list
```

Get Event Log
-------------

get latest 5 event log 

```
ipmitool sel list last 5
```


Remote Control
--------------

use BMC user/passwd/ip to management remote server 

```
ipmitool -U ＜username＞ -P ＜password＞ -H ＜BMC ip＞ chassis power status
```

