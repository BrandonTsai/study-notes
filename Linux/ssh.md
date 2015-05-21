SSH
===

SSH Server configuration
------------------------

### Allow password login
```
$ sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
```

### Allow root login
```
$ sed -i "s/PermitRootLogin without-password/PermitRootLogin yes/g" /etc/ssh/sshd_config
```

remember to restart ssh service after configuration modified.

```
$ service ssh restart
```

Auto login with password
------------------------

use sshpass 

```
$ sudo apt-get install sshpass
$ sshpass -p 'mypassword' ssh user@hostname
$ sshpass -f my_password.txt ssh user@hostname
```

Login without Password
-----------------------
refer:
- http://www.thegeekstuff.com/2008/11/3-steps-to-perform-ssh-login-without-password-using-ssh-keygen-ssh-copy-id/


Step 1: Create public and private keys using ssh-key-gen on local-host
```
$ ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa
```

Step 2: Copy the public key to remote-host using ssh-copy-id
```
$ ssh-copy-id -i ~/.ssh/id_dsa.pub user@10.2.2.22
```

or copy with sshpass 

```
$ sshpass -p "mypassword" ssh-copy-id user@10.2.2.22
```

then we can login to remote-host without entering the password



Disable SSH host key checking
-----------------------------

refer:
- http://linuxcommando.blogspot.tw/2008/10/how-to-disable-ssh-host-key-checking.html


When you login to a remote host for the first time, 
the remote host's host key is most likely unknown to the SSH client. 
The default behavior is to ask the user to confirm the fingerprint of the host key.

```
$ ssh peter@192.168.0.100
The authenticity of host '192.168.0.100 (192.168.0.100)' can't be established.
RSA key fingerprint is 3f:1b:f4:bd:c5:aa:c1:1f:bf:4e:2e:cf:53:fa:d8:59.
Are you sure you want to continue connecting (yes/no)? 
```

Solution:

```
ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no peter@192.168.0.100
```


