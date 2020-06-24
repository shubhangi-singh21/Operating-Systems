#Create, Update and Remove Software in Linux

#Installing a software
#Dpkg is a package manager for Debian and its derivatives such as Ubuntu and Linux Mint. 
#It is used to install, build, remove and manage .deb packages.
#Unlike other Linux package management systems, it cannot automatically download and install packages with their dependencies.

#To install a local package, use the dpkg command with the -i flag along with package name:
#Example:

sudo dpkg -i /home/vm/downloads/atom-amd64.deb

#You'll see some errors after this command, but that's okay! 
#The atom package has some dependencies that aren't installed on your machine yet, and dpkg is just warning you that they need to be installed.

#After this, run the apt command to fix the missing dependencies:

sudo apt install -f

#You'll be prompted to confirm your decision to continue with the operation by typing "Y" (for "Yes"), midway through the process

#The Atom editor software will now be installed, which can be verified by the dpkg command:

dkpg -s atom

#You may see output similar to:
Package: atom
Status: install ok installed
Priority: optional
Section: devel
Insalled-Size: 456200
Maintainer: GitHub <atom@github.com>
Architecture: amd64
Version: 1.21.0

#Extracting an Archive

#From the terminal, change to the directory where yourfile.tar has been downloaded.
#For this example, we will archive the file "extract_me.tar" is located in "/home/vm/downloads/"
#We can use the Linux tar command to extract it using this command:

sudo tar -xvf extract_me.tar

#The contentsof the archive (the file named "great_job") will be extracted, and you may see output simialr to:

home/vm/extract_me/
home/vm/extract_me/great_job

#Archiving Files

#You can use the tar command to do the reverse operation, creating an archive.
#For this example, there are three files in my /home/vm/documents folder named "Earth", "Mercury", and "Venus". We will use tar to archive them into the file "Planets.tar" using this command (one line):

tar -cvf Planets.tar /home/vm/documents/Earth /home/vm/documents/Mercury /home/vm/documents/Venus

#"Planets.tar" will then be added to your current directory, and will contain the three planet files. You may see output similar to:

tar: Removing leading '/' from member names
/home/vm/documents/Earth
/home/vm/documents/Mercury
/home/vm/documents/Venus

#Using the ls command in your current directory, you may see:
Planets.tar




