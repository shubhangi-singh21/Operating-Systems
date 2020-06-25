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

#Creating Partitions

#For this example we will create new partition using fdisk. 
#We will partition the second drive into two partitions:one swap partition of 1GB and another of size 9GB.
#The file system on the second partition will be ext4.

sudo fdisk /dev/sda

#To create a new partition, the command control n is used.
#However, since all the space on the disk is currently allocated, you'll need to first free up space by deleting the default partition.
#Use the d command control to delete the default partition. 
#When you issue the d command control, fdisk asks you to enter the number of partitions you want to delete. Since you only have one partition, the default one, fdisk will automatically select and delete it to continue.

#You're now able to create your new partitions. Enter the command control for creating a new partition, n.
#fdisk will present you with two options to select from: p for primary, and e for extended or logical partition. 
#Since we want to create the partitions on the actual physical disk, select p by pressing Enter.
#Next, you'll need to provide the partition number for the new partition. Since it's a primary partition, it can only be labelled from 1-4.
#Give the number 1 to this first partition by pressing Enter, or optionally entering 1.
#You'll then need to provide the starting sector (memory location) of the new partition, from where you want to allocate. Here, press Enter to select the default value 2048.
#Provide the last sector of the new partition, up to where you want to allocate.
#Two important things happen here: the partition size is set to 1GB, and the partition type is set to Linux.

#Now we move on to create the second partition using command control n.
#Select p for a primary partition.
#Select partition number 2 to issue partition numbers in sequence.
#Select the default partition starting sector, which is the next sector from the last partition you allocated.
#Also select the default last sector, which will be the last sector of the remaining disk space.
#The second partition is now created!
#Before committing your changes, you'll change the second partition to a different partition type.
#You'll change the first partition type to a Linux swap type. 
#Enter command control t to change the partition type, and select the first partition.
#You can use the command control L to view a list of all partition types.
#Enter 82 to change the partition type to ‘Linux swap / Solaris', and press Enter.
#The partition type will be changed to match the selection.
#Up to this point, you've just been editing the partition table in memory. You can use the q command here to quit fdisk without committing changes to the disk.
#You can also update your partitions by using the d and n commands to remove and add new partitions.
#You can also use the v command to verify your changes.
#If you're satisfied with the changes you've made so far, you can commit them to the disk by using the w command.

