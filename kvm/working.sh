virt-install   \
   --name kub_master  \
   --ram=5120  \
   --graphics vnc \
   --disk path=/var/lib/libvirt/images/kub_master.qcow2,bus=virtio,size=7  \
   --cdrom /home/mbareck/kvm/iso/ubuntu-18.04.5-live-server-amd64.iso