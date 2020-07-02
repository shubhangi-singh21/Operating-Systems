#Create, Modify, and Remove File and Folder Permissions in Windows via Powershell

#Example:1
#For the example, in the path "C:\Users\vm\Documents\" I have a file named "important_document." Our goal in this example is to change the permissions so that the user "Kara" only has read access to the file.

#First, we will use ICACLS to view the existing permissions for the file using this command:

ICACLS C:\Users\vm\Documents\imporatant_document


