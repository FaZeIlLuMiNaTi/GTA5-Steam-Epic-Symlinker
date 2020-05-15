@echo off
:start
	rem Set the working directory to the one we laucnhed from - running as admin changes the directory to system32 usually.
	rem Then check the permissions of this script - are we running as admin?
	pushd %~dp0
	goto get_new_path

:get_new_path
	rem Get the user to enter the path of their Epic Games GTA folder.
	echo Please enter the path for Epic Games' GTAV folder.
	set /p EGSGTAV=Full path: 
	goto are_you_sure

:are_you_sure
	rem Get the user to check the path is correct
	set /P AREYOUSURE=Are you sure (Y/[N])? 
	if /I "%AREYOUSURE%" NEQ "Y" GOTO get_new_path
	else goto run_task

:run_task
	rem We're good to go.
	rem Here, we're symlinking all .rpf files in the root directory of the GTA folder.
	for /F "tokens=1 delims=" %%A in ('dir /b *.rpf') do (
		mklink /H "%EGSGTAV%\%%A" "%%A"
	)

	rem Creating dlcpacks folders
	if not exist "%EGSGTAV%\update" (
		mkdir "%EGSGTAV%\update"
		mkdir "%EGSGTAV%\update\x64"
		mkdir "%EGSGTAV%\update\x64\dlcpacks"
	)

	rem update.rpf is the only file in here, but we can scan for others in case rockstar change this
	pushd update
		for /F "tokens=1 delims=" %%A in ('dir /b *.rpf') do (
			mklink /H "%EGSGTAV%\update\%%A" "%%A"
		)
	
		rem Here is where all the dlc packs are, we iterate through each directory, create it in the epic folder and then mirror the dlc.rpf
		pushd x64\dlcpacks
			for /D %%s in (*) do (
				pushd "%%s"
					for /F "tokens=1 delims=" %%A in ('dir /b *.rpf') do (
						mkdir "%EGSGTAV%\update\x64\dlcpacks\%%s"
						mklink /H "%EGSGTAV%\update\x64\dlcpacks\%%s\%%A" "%%A"
					)
				popd
			)
		popd
	popd
	rem Back in root now

	rem create folders for audio and sound effects
	if not exist "%EGSGTAV%\x64" (
		mkdir "%EGSGTAV%\x64"
		mkdir "%EGSGTAV%\x64\audio"
		mkdir "%EGSGTAV%\x64\audio\sfx"
	)
	rem mirror all audio and sound effects rpf files
	pushd x64\audio
		for /F "tokens=1 delims=" %%A in ('dir /b *.rpf') do (
			mklink /H "%EGSGTAV%\x64\audio\%%A" "%%A"
		)
		pushd sfx
			for /F "tokens=1 delims=" %%A in ('dir /b *.rpf') do (
				mklink /H "%EGSGTAV%\x64\audio\sfx\%%A" "%%A"
			)
		popd
	popd
	rem Back in root now

:end
	popd
	echo .
	echo Process complete!
	pause