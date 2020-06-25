#Maintaining Efficient Process Utilization on your Computer in Linux

#Terminating a specific process
#The ps -aux command allows you to list all currently running processes on a Linux machine.
#To filter the processes you're interested in, you can pipe the output of ps through grep.

#Example, we have 2 malicious processes currently running on my machine called "totally_not_malicious".
#We can run the ps and grep command to find them:

ps -aux | grep "totally_not_malicious"

#You should see output similar to where the top two lines are the two processes, while the last line is the grep process you just used to search for them. 
#Check out the four-digit numbers on the left of each of the rows; they are the process IDs.

#To stop a process, you can use the kill command.
#You need to use the sudo command to have permission to stop them.
#You also need to specify the ID of the process.

sudo kill [PROCESS ID]

#After killing the processes, you can verify that they're no longer running by running the original command again:

ps -aux | grep "totally_not_malicious"

#Terminating multiple processess

#In this example, we will find the processes running on my computer containing the word "razzle".

ps -aux | grep "razzle"

#To kill each of the processes from the search results, you can use the same kill command as before, substituting in each process ID:

sudo kill [PROCESS ID]

