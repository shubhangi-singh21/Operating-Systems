#Archiving files with Powershell

#Now we'll build multiple files into a .zip archive using Powershell. 
#Open Powershell and navigate to this folder. (Make sure you have administrative privileges enabled!).
#So, search the Start Menu for Powershell, right-click it, and select "Run as Administrator". Use the command to navigate to the "Documents" folder:

cd C:\Users\vm\Documents\

#Once you're there, you can create a .zip archive (called Planets.zip) using this command:

Compress-Archive -Path Earth, Mercury, Venus Planets.zip

#Install and uninstall software using Windows CLI

#In this example, we will install VLC.
#There are alternatives to manually downloading and running installers when you need to install or manage programs on Windows. 
#Chocolatey is a super convenient command-line tool for managing your installed applications, that can be used in the Powershell terminal. 
#It hasn't been pre-installed on your virtual machine windows-instance, so you'll need to add it yourself.
#To install or remove programs, you need administrative privileges.
#So, open Powershell by searching for it in the Windows start menu, then right-click it and select "Run as Administrator".
#NOTE: Some of the commands using Chocolatey print output that looks like an error message. This is usually ok, and you can proceed anyway. 
#To avoid having this displayed, you can enter this command in your Powershell terminal:

$ErrorActionPreference= 'silentlycontinue'

#Installing Chocolatey
#In your open Powershell terminal, you first need to register the Chocolatey package with Powershell.
#Your machine may currently have it registered incorrectly, so unregister it with this command (if you see an error, it means that it is not registered):

Unregister-PackageSource -Name chocolatey

#Then you can re-register Chocolatey, so that it can be installed using this command (one line)

Register-PackageSource -Name chocolatey -ProviderName Chocolatey -Location http://chocolatey.org/api/v2/

#You'll need to enter "Y" for "Yes" when prompted to confirm the operation.

#Using Chocolatey to install VLC
#Now you can use Chocolatey to install VLC (a media player) using the following command, and bypassing the need to find and download an installer manually:

Install-Package -Name vlc -Source chocolatey

#You'll be prompted to confirm the installation midway through the process. 
#To do this, enter "A" (for "All") to accept all prompts at once.
#You can verify that VLC has successfully been installed with this command:

Get-Package -Name vlc

#You may see output similar to:
Name      Version     Source                            ProviderName
----      -------     ------                            ------------
vlc       2.2.6       C:\Chocolatey\lib\vlc.2.2.6\v...  Chocolatey


#Uninstalling a Software
#In this example we will uninstall a software called GIMP.
#You can also use Chocolatey to uninstall programs, too.
#If you've closed your Powershell window, reopen it again by searching for it in the Start Menu, then right-clicking it and selecting "Run as Administrator".
#You can use uninstall GIMP, which is a photo editor, using this command:

Choco Uninstall GIMP

#You'll be prompted to confirm your choice again by typing "Y" (for "Yes"). 
#Once the process finishes, GIMP will no longer be installed on your system. 
#You can verify this with the following command and seeing that GIMP is not listed:

Get-Package
