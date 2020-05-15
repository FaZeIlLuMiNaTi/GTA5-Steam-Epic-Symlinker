# GTA5-Steam-Epic-Symlinker
Dumb script to symlink GTA5 from your Steam library to your Epic Games library

# This will save you nearly 90GB of disk space (GTA5 via Steam and Epic Games from one installation)

# Please read through the script and instructions so you know what it's doing. This script could potentially cause issues in your Steam/Epic Games libraries if not ran properly. I take no responsibility for any data loss.

# Requirements
 * GTA 5 purchased on Steam and Epic Games
 * GTA 5 installed via Steam
 * Your Steam and Epic Games installations of GTA 5 will need to be on the same partition
 * If you've already started install GTA5 from Epic Games, cancel it and remove the GTAV folder

# Instructions
1. Begin a clean installation of GTA5 from Epic Games. When you've downloaded about 20MB, completely exit Epic Games.
2. Drop symlinker.bat in your Steam GTA5 folder and run it.
3. When prompted, paste in your GTAV folder location from Epic Games (mine is E:\Epic Games\GTAV) and press enter.
4. Double check you entered the correct directory and press Y if it is correct. Press N to return back and re-enter the path.
5. When you see "Process complete!", you should have all of the game's .rpf files in your Epic Games GTAV folder. These are not copies, they are mirrors of the original files.
6. Launch Epic Games, go to Library and click Resume under GTA5. Epic Games will now verify the game files and download the missing ones. 
7. Done

# Notes
* The game might fail to launch when you finish this process. Just click OK (or whatever it says) and try again. It will have to install (another?) copy of the R* launcher and some redists, so be patient.
* This script is more of a PoC than a reliable script, use at your own discretion.
* When I tested this, I had to download 357mb of files - this could probably be reduced, but this script should be good enough in its current form for most people. Feel free to play around and submit PRs.
*  I have absolutely no idea how this will play out when updates are released for the game. Personally, I'm going to update via Steam, then launch Epic Games and let it verify the files.
