#!/bin/bash

origin_host=$1
new_host=$2

virt-clone --connect qemu:///system \
--original $origin_host \
--name $new_host \
--file "/var/lib/libvirt/images/$new_host.qcow2"