#!/bin/bash


virt-install \
    --connect qemu:///system \
    --name kube_master \
    --memory 5120 \
    --disk size=5 \
    --os-variant ubuntu20.10 \
    --cdrom "/home/mbareck/Documents/iso/ubuntu-20.10-live-server-amd64.iso" \
    --location "/home/mbareck/Documents/iso/ubuntu-20.10-live-server-amd64.iso" \
    --graphics none \
    --console pty,target_type=serial -x 'console=ttyS0,115200n8 serial'
