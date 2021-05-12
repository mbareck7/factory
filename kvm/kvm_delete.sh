#!/bin/bash

host=$1

virsh destroy $host 2> /dev/null
virsh undefine  $host
virsh pool-refresh default
virsh vol-delete --pool default "$host.qcow2"