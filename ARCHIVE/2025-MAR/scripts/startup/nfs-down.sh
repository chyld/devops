#!/bin/bash

echo "NFS DOWN is running"
echo "who is mounted?"
# mount
echo "check the systemctl"
systemctl status mnt-Share.mount
echo "now let's unmount"
umount /mnt/Share
echo "and now check again the mount status"
systemctl status mnt-Share.mount
echo "NFS DOWN is complete"

