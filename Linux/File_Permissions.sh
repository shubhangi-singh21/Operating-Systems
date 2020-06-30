#Create, Modify, Remove File and Folder Permissions in Linux

#Checking file permissions
#Before you can even begin changing the permission of a file or folder, you need to first check the permissions of the specific file/folder. 
#To display ownership and permissions for a file, you can use ls with the -l flag and the name of the file you're interested in.

#Example:

ls -l new_file

#You may see output similar to:
-rw------- 1 root root 23 June 9 02:13 new_file
#You can see that it's owned by the "root" user, and that the owner has read andwrite (but not execute) permissions while everyone else has none at all.

#Changing File Permissions

#Now, to change the permissions of new_file (from the previous step) so that the owner has execute permissions on top of their current permissions. 
#To do this, you'll use the chmod command, with the argument 700. The two zeros keep everyone, but the owner, from having any permissions at all, and the seven grants all available permissions to the owner (including execute). 
#Keep in mind that because the file is owned by "root" you'll need to use sudo.

sudo chmod 700 new_file

#Now running the ls command;

ls -l new_file

#The output will be:
-rwx------ 1 root root 23 June 9 02:13 new_file

#Checking Folder Permissions
#To view its current permissions using ls, this time with the -ld flag rather than -l because you're viewing a directory instead of a normal file.

ls -ld new_folder

#You may see output similar to:
drw-r--r-- 2 root root 4096 June 9 02:13 new_folder
#As you can see, the owner of the file (the root user) has read and write permissions, and everyone else can read only.

#Changing Folder Permissions
#NOTE:When using chmod on a directory, files within that directory are not affected.

#In the above example we used the numerical arguement method. 
#An alternate method includes using alphabetical syntax
#u:user g:group o:other
#r:read w:write x:execute a:all

#Example:

sudo chmod u+x new_folder

#using ls -ld command again,you will see output similar to:
drwx-w-r-- 2 root root 4096 June 9 02:13 new_folder

#Similarly you can remove read permissions from everyone else using the command below

sudo chmod o-r new_folder

#You may see output similar to:
drwx -w---- 2 root root 4096 June 9 02:13 new_folder

#Changing Owners
#Let us use a folder called taco
#We can view it's permissions using ls command

ls -ld taco/

#You may see output similar to:
drwxr-xr-x 2 root root 4096 Oct 21 12:17 taco/

#You can see from this that the root user currently owns this file.
#There's another user account on the machine called "cook".
#Let us make "cook" the owner of the file, using the chown command like this

sudo chown cook /home/vm/taco

#Using the ls command to check permissions:

ls -ld taco/

#You may see output similar to:
drwxr-xr-x 2 cook root 4096 Oct 21 12:17 taco/

#Adding Multiple Permissions at once
#Let us use a file called doc2
#We can see it's permissions using ls command

ls -l doc2

#You may see output similar to:
-rw-r--r-- 1 root root 14 Apr 9 02:13 doc2

#To add read, write, and execute permissions to everyone at once using this command

sudo chmod a+rwx doc2

#Using ls command to check permissions:

ls -l doc2

#You may see output similar to:
-rwxrwxrwx 1 root root 14 Apr 9 02:13 doc2

#This could also be achieved using the numeric arguement syntax:

sudo chmod 777 doc2


