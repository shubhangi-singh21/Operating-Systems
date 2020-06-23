#Create, Modify, Remove Files and Folders in Linux

#DIRECTORIES
#Directories (folders) in Linux are created using the mkdir command. 
#The command takes the directory name as the argument.

mkdir dir_name

#Multiple directories can be supplied as arguments, and mkdir will create all of them.

mkdir dir1 dir2 dir3

#Parameters

#mkdir can take three options:

#-p: allow mkdir to create parent directories if they don't exist
#-m: (mode) used to set permissions of directories during creation
#-v: run command in verbose mode

#Removing empty directories
#To remove empty directories, use the rmdir command. The name of the directory to be removed is passed as an argument.

rmdir dir_name
rmdir dir1 dir2 dir3

#Removing non-empty directories
#To remove a non-empty directory, we use the -r flag along with rm command.

rm -r non_empty_dir


#Creating files
#By default, the touch command is used to change the modification and access times of a file. 
#If the file doesn't exist, the touch command is used to create a file with default permissions.

touch new_file

#Copying files and directories
#The cp command is used to make a copy of one or more directories or files. 
#The command takes at least one source name and one target name.

#Example: Copying the file "source_file" in the directory /home/user/ to the directory "duplicates" as "target_file".

cp /home/user/source_file /home/user/duplicates/target_file

#Moving files and directories
#The move command is used to move one or more files or directories into a different location, or rename them to a new name. 
#You're required to pass at least one source and target file names or directories.

#Example: Moving the file "source_file" in /home/user/ to the directory "moved_files" and give it the name "target_name".

mv /home/user/source_file /home/user/moved_files/target_name


