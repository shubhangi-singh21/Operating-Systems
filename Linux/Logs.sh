#Using Logs to Track Down an Issue in Linux

#Viewing logs in Linux
#On Linux machines, logs are stored in the /var/log directory.
#We can view them using command:

ls /var/log

#The logs on Linux can be viewed like any text file.
#We can use the command below to view the contents of for example syslog:

sudo cat /var/log/syslog

#The log contents are super long, so we'll have to scroll through the logs to look for the entries that are relevant to us.
#The commands du, sort, and head show the top five largest files, starting from your /home directory:

sudo du -a /home | sort -n -r | head -n 5


