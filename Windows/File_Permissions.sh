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

#Example 2:
#There's a folder called "Secret" in my path "C:\Users\vm\" where the user "Kara" has read access. 
#Our goal in this example is to alter these permissions so that another user (named "Phoebe") has read permissions as well, and Kara has both read and write permissions. 
#You can view the current permissions with this command, and see that Kara has read permissions and Phoebe is not included.

ICACLS C:\Users\vm\Secret\

#You may see output similar to:
WINDOWS-INSTANC\Kara:(R)
NT AUTHORITY\SYSTEM:(I)(OI)(CI)(F)
BUILTIN\Administrators:(I)(OI)(CI)(F)
BUILTIN\Users:(I)(RX)
BUILTIN\Users:(I)(OI)(CI)(IO)(GR,GE)
Everyone:(I)(RX)
Everyone:(I)(OI)(CI)(IO)(GR,GE)

#First, give Phoebe read access. You can grant her these permissions with the command below:

ICACLS C:\Users\vm\Secret\ /grant "Phoebe:(r)"

#You can verify this using:

ICACLS C:\Users\vm\Secret\

#You may see output similar to:
WINDOWS-INSTANC\Phoebe:(R)
WINDOWS-INSTANC\Kara:(R)
NT AUTHORITY\SYSTEM:(I)(OI)(CI)(F)
BUILTIN\Administrators:(I)(OI)(CI)(F)
BUILTIN\Users:(I)(RX)
BUILTIN\Users:(I)(OI)(CI)(IO)(GR,GE)
Everyone:(I)(RX)
Everyone:(I)(OI)(CI)(IO)(GR,GE)

#The next step is to grant Kara write permissions.
#You don't need to remove her existing permissions first, like you did before; you only need to add "write" to her existing permissions with this command:

ICACLS C:\Users\Qwiklab\Secret\ /grant "Kara:(w)"

#You can verify this using:

ICACLS C:\Users\vm\Secret\

#You may see output similar to:
WINDOWS-INSTANC\Phoebe:(R)
WINDOWS-INSTANC\Kara:(R,W)
NT AUTHORITY\SYSTEM:(I)(OI)(CI)(F)
BUILTIN\Administrators:(I)(OI)(CI)(F)
BUILTIN\Users:(I)(RX)
BUILTIN\Users:(I)(OI)(CI)(IO)(GR,GE)
Everyone:(I)(RX)
Everyone:(I)(OI)(CI)(IO)(GR,GE)

#Example 3:
#There's another folder in "C:\Users\vm\" called "Music".
#The user group, named "Everyone", has both read and write permissions for this folder.
#User groups are sets of local users that allow you to change multiple users' permissions at once. 
# For example, a computer that's used by lots of employees at a business may have a usergroup called "Employees" that new hires are added to when they onboard. This automatically gives them access to everything they need, without it having to be set manually. The "Everyone" group is created by default, and every new user is automatically added.
#Our goal for this example is to change the permissions for this folder so that the "Everyone" group only has read permission (not write).

#We can view the current permissions with this command:

ICACLS C:\Users\vm\Music\

#You may see output similar to:
NT AUTHORITY\SYSTEM:(I)(OI)(CI)(F)
BUILTIN\Administrators:(I)(OI)(CI)(F)
BUILTIN\Users:(I)(RX)
BUILTIN\Users:(I)(OI)(CI)(IO)(GR,GE)
Everyone:(I)(RX)
Everyone:(I)(OI)(CI)(IO)(GR,GE)

#You can change permissions for groups in exactly the same way as you do for users.
#To remove the group's current permissions, and then re-grant them a read permission, use these commands:

ICACLS C:\Users\Qwiklab\Music\ /remove "Everyone"

ICACLS C:\Users\Qwiklab\Music\ /grant "Everyone:(r)"

ICACLS C:\Users\vm\Music\

#You may see output similar to:
Everyone:(R)
NT AUTHORITY\SYSTEM:(I)(OI)(CI)(F)
BUILTIN\Administrators:(I)(OI)(CI)(F)
BUILTIN\Users:(I)(RX)
BUILTIN\Users:(I)(OI)(CI)(IO)(GR,GE)
Everyone:(I)(RX)
Everyone:(I)(OI)(CI)(IO)(GR,GE)

#Example 4:
#Back in the "documents" folder from before, I have a file called "not_so_important_document".
#In this example, we will modify the permissions for that file so that the group called "Authenticated Users" has "Write" access.
#The "Authenticated Users" group is another automatically created group, containing all users with admin privileges. 
#You can iew the current permissions with this command, to see what the starting point for this file is:

ICACLS C:\Users\vm\Documents\not_so_important_document

#You may see output similar to:
NT AUTHORITY\SYSTEM:(I)(F)
BUILTIN\Administrators:(I)(F)
BUILTIN\Users:(I)(RX)
Everyone:(I)(RX)

#This will show you that the "Authenticated Users" group is currently not listed.
#This means that the only step required is to grant them write access, which you can do with this command:

ICACLS C:\Users\Qwiklab\Documents\not_so_important_document /grant "Authenticated Users:(w)"

#That should successfully grant them write permissions.
#You can use the same command as earlier to verify that the commands were a success:

ICACLS C:\Users\Qwiklab\Documents\not_so_important_document

#You may see output similar to:
NT AUTHORITY\Authenticated Users:(W)
NT AUTHORITY\SYSTEM:(I)(F)
BUILTIN\Administrators:(I)(F)
BUILTIN\Users:(I)(RX)
Everyone:(I)(RX)

#Example 5:
#In this example, we will change the permissions of another file in the "Documents" folder.
#The file named "public_document" needs to be made publically readable, so that anyone on the system is able to read it. 
#As usual, view the file's commands first:

ICACLS C:\Users\vm\Documents\public_document



