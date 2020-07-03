#Create, Modify, and Remove File and Folder Permissions in Windows via Powershell

#Example:1
#For the example, in the path "C:\Users\vm\Documents\" I have a file named "important_document." Our goal in this example is to change the permissions so that the user "Kara" only has read access to the file.

#First, we will use ICACLS to view the existing permissions for the file using this command:

ICACLS C:\Users\vm\Documents\imporatant_document

#You may see output similar to:
WINDOWS-INSTANC\Kara:(R)(W)
NT AUTHORITY\SYSTEM:(I)(F)
BUILTIN\Administrators:(I)(F)
BUILTIN\Users:(I)(RX)
Everyone:(I)(RX)
#As you can see, Kara currently has read and write permissions (shown as "R" and "W").
#We need her to only have read permissions, so we need to remove her write permission.
#An easy way to accomplish this is to remove all of Kara's permissions and then re-add her read permission.
#You can remove her entirely from the file's permissions and check to see that it worked with these commands:

ICACLS C:\Users\vm\Documents\imporatant_document /remove "Kara"

#You can check whether Kara is removed or not using:

ICACLS C:\Users\Qwiklab\Documents\important_document

#As you can see, Kara is no longer listed in the file's permissions. To re-grant her only the read permission, use these command:

ICACLS C:\Users\vm\Documents\imporatant_document /grant "Kara:(r)"

#You can check this again using:

ICACLS C:\Users\Qwiklab\Documents\important_document





