#Terminating a specific process on Windows

#On Windows, you can view running processes in the Task Viewer, or use Powershell
#For these operations, you'll need to be running a Powershell terminal in Administrative mode.
#So, search the Start Menu for Powershell, right-click it, and select "Run as Administrator".

#From Powershell, you can use Get-Process to search for a process by name. 
#The "totally_not_malicious" process is running on this machine, too. Search for it, using this command:

Get-Process -Name "totally_not_malicious"

#You will see output similar to:

