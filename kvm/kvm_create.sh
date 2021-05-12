#!/bin/bash
    # source-host
    # source-path
    # source-dev
    # source-name
    # target



name=$1
# Step 1: Configure Storage Pool
    # virsh pool-list --all
    # virsh pool-info kube_master_pool
    # virsh pool-define-as kube_master_pool dir - - - - "/mnt/kvm-data/$name/"

    # virsh pool-build $name
    # virsh pool-start $name
    # virsh pool-autostart kube_master_pool

# Step 2: Configure Storage Volumes/Disk Images
    # man qemu-img


    # qemu-img create -f raw "/mnt/kvm-data/$name/v_$name.img" 10G


# Step 3: Create Virtual Machines

# man virt-install

# virt-install --name=kube_master --disk path="/mnt/kvm-data/$name/v_$name.img" \
# --graphics spice --vcpu=2 --ram=4048 \
# --location=/home/mbareck/Documents/iso/ubuntu-20.04.2-live-server-amd64.iso \
# --network bridge=virbr0
# --boot cdrom,hd,menu=on

# virt-install \
# --name vm_name \
# --ram=2048 \
# --vcpus=2 \
# --disk pool=guest_images,size=30,bus=virtio,format=qcow2 \
# --cdrom /var/iso/debian.iso \
# --network bridge=kvmbr0,model=virtio \
# --graphics vnc,listen=0.0.0.0,password=Qwerty1234 \
# --boot cdrom,hd,menu=on







 virt-install \
--name kube_master \
--description "Ubuntu Server 20.10 | kube_master" \
--ram=1024 \
--vcpus=2 \
--os-type=Linux \
--os-variant=ubuntu20.10 \
--disk path=/var/lib/libvirt/images/kube_master.qcow2,bus=virtio,size=10 \
--graphics none \
--location /home/mbareck/Documents/iso/ubuntu-20.10-live-server-amd64.iso \
--network bridge:virbr0  \
--console pty,target_type=serial -x 'console=ttyS0,115200n8 serial'