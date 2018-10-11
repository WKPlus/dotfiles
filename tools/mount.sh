#!/bin/bash

sudo mount -o resvport,nolock 10.1.77.82:/share ~/share

#diskutil info /Volumes/YOUR_NTFS_DISK_NAME
#Device Node:              /dev/disk1s1
#hdiutil eject /Volumes/YOUR_NTFS_DISK_NAME
#sudo mkdir /Volumes/MYHD
#sudo mount_ntfs -o rw,nobrowse /dev/disk1s1 /Volumes/MYHD/
