#Partition and Format a Disk Drive in Linux

#Terminologies

#Blocks
#Blocks are a layer of storage devices that allow individual access to each independently.
#They allow programs to access storage without worrying about whether the underlying hardware device is a hard drive, solid state drive, flash drive, etc.
#In Linux, you can view block devices and file systems attached to your system using the lsblk command.

lsblk

#You may see output similar to:
NAME	MAJ:MIN	RM	SIZE	RO	TYPE	MOUNTPOINT
sda	8:0	0	10G	0	disk
 |_sda1 8:1	0	10G	0 	part
sdb	8:16	0	10G	0	disk
 |_sdb1 8:17	0	10G	0	part /

#You may see that your instance has two block devices attached to it (disks).
#Each of them is 10GB in size. 
#The column MOUNTPOINT shows where a block device is mounted.
#In this case, the MOUNTPOINT is displaying "/" against sdb, which means the second disk (sdb) is mounted at the root of the Linux file system tree.
#Thus, the files you're seeing on your system right now are from this disk.

#You can view disks mounted on the system using the df command.
#his command is normally used to display the amount of space available on the file system. 
#Use the -h option to display file sizes in human readable format.

df -h

#You may see output similar to:
Filesystem	Size	Used	AVail	Use%	Mounted on
udev		1.8G	0	1.8G	0%	/dev
tmpfs		371M	6.4M	365M	2%	/run
/dev/sdb1	9.8G	1.1G	8.3G	12%	/
tmpfs		1.9G	0	1,9G	0%	/dev/shm
tmpfs		5.0M	0	5.0G	0%	/run/lock
tmpfs		1.9G	0	1.9G	0%	/sys/fs/cgroup

#Partitions

#Instead of using a storage block as a whole, it's common practice to divide a storage block into different partitions.
#Partitions can be different sizes, and formatted to different filesystems.
#This allows you to use a single storage device for different purposes.

#You can display partition information using the fdisk command.
#You can use the -l flag to list partitions in the block.

sudo fdisk -l

#To list partiton contained in specific environment like /dev/sdb, pass /dev/sdb to the fdisk command.

sudo fdisk -l /dev/sdb

#fdisk displays information contained in the partition table, where information about partitions is stored.
#When the fdisk command is used without options, it provides a menu-driven environment for creating and deleting partitions.

#Mount and Unmount

#Mounting and unmounting mean making devices available or unavailable on a Linux file system.
#This is accomplished by the mount and unmount commands.
#Before modifying a disk, you should first unmount it from the system, using the umount command. 
#When modifications on the disk are done, you should mount it back onto the system.
#Exmaple:
#Start fdisk by passing the disk you want to partition as the parameter.

sudo fdisk /dev/sda

#fdisk will start in interactive mode. You can use m to use help provided by the command.
#You can use p to show details about partitions on the disk.
#Enter q to exit interactive mode when you are finished exploring.


