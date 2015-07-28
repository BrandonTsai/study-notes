KVM
====

refer:
- http://serverascode.com/2014/03/17/trusty-libvirt.html



Set up cloud-init
--------------------

we use cloud-utils to set up cloud-init image.

set up cloud-utils:

```
$ wget https://launchpad.net/cloud-utils/trunk/0.27/+download/cloud-utils-0.27.tar.gz
$ tar -xzvf cloud-utils-0.27.tar.gz
$ sudo apt-get install genisoimage
```

write user-date, remember to reset hostname, password, and sshkey.

```
#cloud-config
hostname: @HOSTNAME
password: @PW
chpasswd: { expire: False }
ssh_pwauth: True
ssh_authorized_keys:
  - @SSHKEY
```

then we can generate user-data image:

```
$ ~/cloud-utils-0.27/bin/cloud-localds user-data.img user-data
```


Download required cloud-image
-----------------------------

download following qcow2 image:
http://cloud-images.ubuntu.com/releases/12.04.2/release/ubuntu-12.04-server-cloudimg-amd64-disk1.img



Install and setup KVM:
---------------------------------

```
sudo apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils virt-viewer virt-manager bridge-utils
```

create buildVM.sh:

```bash
#!/bin/bash -ex

CUR_DIR=`pwd`
VM_NAME=$1
BASE_IMAGE=ubuntu-12.04-server-cloudimg-amd64-disk1.img

gen_libvirt_xml()
{
    local vm_name=$1
    local mem_size=$2
    local cpu_count=$3
    local br=$4

    let mem_size=mem_size\*1024
    cat > libvirt.xml <<EOF
<domain type='kvm'>
    <name>$vm_name</name>
    <memory>$mem_size</memory>
    <os>
        <type arch='x86_64' machine='pc-0.14'>hvm</type>
    </os>
    <features>
        <acpi/>
    </features>
   <vcpu>$cpu_count</vcpu>
    <devices>

        <disk type='file'>
            <driver type='qcow2'/>
            <source file='$CUR_DIR/$vm_name/rootfs.qcow2.img'/>
            <target dev='vda' bus='virtio'/>
        </disk>

        <disk type='file' device='disk'>
            <source file='$CUR_DIR/$vm_name/user-data.img'/>
            <target dev='vdb' bus='virtio'/>
        </disk>

        <interface type='bridge'>
            <source bridge='$br'/>
        </interface>

        <serial type='pty'>
            <target port='0'/>
        </serial>

        <graphics type='vnc' port='-1' autoport='yes' keymap='en-us' listen='0.0.0.0'/>
    </devices>
</domain>
EOF
}

qemu-img create -f qcow2 -o backing_file=/home/ubuntu/$BASE_IMAGE rootfs.qcow2.img
/home/ubuntu/cloud-utils-0.27/bin/cloud-localds user-data.img /home/ubuntu/user-data
gen_libvirt_xml $VM_NAME 2048 2 br0
virsh define libvirt.xml
#virsh snapshot-create $VM_NAME
virsh start $VM_NAME

```

run script


use **Virsh list** to Check VM is running


Set up Networking
-----------------

access VM via VNC.
Server IP: `<Physical IP>:<port>`

port increase from 0 to access different running VMs on the `Physical-IP`

for example: `172.16.xx.1:0`


then we can modify the VM's network interface with the same range where Physical Machine belong to.

for example:

`
address 172.16.xx.2
netmask 255.255.255.0
`
