Openstack Basic Usage
=====================


Instance Management
-------------------

##### Boot from image

```bash
nova boot $VM_NAME --flavor $FLAVOR_ID --image $IMAGE_ID --key_name $OS_KEYPAIR --availability_zone $ZONE --security-groups default --user-data $USERDATA
```

##### Boot from image create new volume

```bash
nova boot $VM_NAME --flavor $FLAVOR_ID --key_name $OS_KEYPAIR --availability_zone $ZONE --security-groups default --block-device source=image,id=$IMAGE_ID,dest=volume,size=$VOLUME_SIZE,shutdown=remove,bootindex=0 
```

##### Boot from volume snapshot

```bash
nova boot --flavor $FLAVOR_ID --key_name $OS_KEYPAIR --availability_zone $ZONE --security-groups default --block-device source=snapshot,id=$SNAP_ID,dest=volume,size=$VOLUME_SIZE,shutdown=remove,bootindex=0 $VM_NAME
``

Associate Floating IP
---------------------

```bash
FIP=$(nova floating-ip-create net_external | grep 'net_external' | awk '{print $2}')
nova add-floating-ip $VM_NAME $FIP
```


Image Management
----------------

##### Create Image Snapshop

```bash
nova image-create $VM_NAME $IMAGE_NAME --poll
```

##### Public image

so that other tenant can use this image:

```
glance image-update --is-public True $IMAGE_NAME
```


Volume Management
-----------------

##### Create Volume Snapshot

```bash
nova volume-snapshot-create --display-name $SNAPSHOT_NAME $VOLUME_ID
```

##### Create Volume from Image

```bash
nova help volume-create --image-id $IMAGE_ID --display-name $VOLUME_NAME --volume-type $VOLUME_TYPE $VOLUME_SIZE
```


