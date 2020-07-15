#Terminating a specific process on Windows

#On Windows, you can view running processes in the Task Viewer, or use Powershell
#For these operations, you'll need to be running a Powershell terminal in Administrative mode.
#So, search the Start Menu for Powershell, right-click it, and select "Run as Administrator".

#From Powershell, you can use Get-Process to search for a process by name. 
#The "totally_not_malicious" process is running on this machine, too. Search for it, using this command:

Get-Process -Name "totally_not_malicious"

#You will see output similar to:

Handles   NPM(K)    PM(K)   WS(K)   CPU(s)    Id    SI  ProcessName
-------   ------    -----   -----   ------    --    --  -----------
    182       13     2536   10548            3772    0  totally_not_malicious
    
#To end a process, you can use taskkill and specify the Process ID, or PID, of the process:
#Note: Make sure you replace/substitute the "[PROCESS ID]" with id of the process you got from the previous command

taskkill /F /PID [PROCESS ID]

#You should see this message after running taskkill with the PID for your process, which will likely be different than the ID specified here:

SUCCESS: The process with PID 3772 has been terminated.

#To verify that the process is no longer running, you can search for it again:

Get-Process -Name "totally_not_malicious"

#This should throw an error because no process by that name exists anymore, indicating that you've successfully ended it.

#Terminating multiple processes
#There are processes containing the word "razzle" also running on this VM. 
#Get-Process doesn't handle processes with partially-matching names, like grep does, and running Get-Process -Name "razzle" would result in no matches. 
#However, you can use "wildcards" (asterisks) to look for processes that contain "razzle" in their name:

Get-Process -Name "*razzle*"

#This will show two processes that contain "razzle" in their name:
You can use taskkill, like before, once for each of the "razzle" processes:

Note: Make sure you replace/substitute the "[PROCESS ID]" with id of the process you got from the previous command.

taskkill /F /PID [PROCESS ID]

    
    
    
    
    
    

