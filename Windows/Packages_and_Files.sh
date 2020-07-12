#Archiving files with Powershell

#Now we'll build multiple files into a .zip archive using Powershell. 
#Open Powershell and navigate to this folder. (Make sure you have administrative privileges enabled!).
#So, search the Start Menu for Powershell, right-click it, and select "Run as Administrator". Use the command to navigate to the "Documents" folder:

cd C:\Users\vm\Documents\

#Once you're there, you can create a .zip archive (called Planets.zip) using this command:

Compress-Archive -Path Earth, Mercury, Venus Planets.zip



