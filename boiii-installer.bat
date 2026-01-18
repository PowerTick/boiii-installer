

@echo off
title BOIII INSTALLER
echo ! ================================= !
echo ! BOIII INSTALLER================== !
echo ! ================================= !
echo.
if not exist .\aria2c.exe (
	echo No Aria2 detected...
 	echo.
	echo This most likely from a faulty compilaton!!
	echo Recompile or get a new version off github.
	echo Auto closing...
	ping localhost -n 10 >nul 
	exit
)
echo ! ============ Downloading launcher !

if  exist .\t7_full_game\t7x.exe (
	echo ! == Launcher is already downloaded !
)

if not exist .\t7_full_game\ (mkdir t7_full_game)
if not exist .\t7_full_game\t7x.exe (
	aria2c.exe --download-result=hide --summary-interval=0 --console-log-level=warn --log-level=warn --console-log-level=error --dir=.\t7_full_game "https://master.bo3.eu/t7x/t7x.exe"
	echo.
	echo ! == The launcher has been downloaded !
)
echo.
echo Getting torrent file for the game files!
echo.
echo Downloading torrent for the game files!
if not exist ".\t7_full_game.torrent" (
	aria2c.exe --download-result=hide --summary-interval=0 --console-log-level=warn --log-level=warn --console-log-level=error "https://web.archive.org/web/20230629141953/https://reactiongaming.us/community/attachments/t7_full_game-torrent.1119/?hash=9e32d123bf2a6b96e23a3e6935deffd2"
	echo Downloaded torrent!
	echo
)
else (
	echo Torrent already downloaded!
)
echo.
echo Downloading game files!
if exist ./t7_full_game/boiii_players/ (
	aria2c.exe --max-overall-upload-limit=10240 --seed-time=0 -s16 -x16 --file-allocation=trunc --download-result=hide --summary-interval=0 --console-log-level=warn --log-level=warn --console-log-level=error ".\t7_full_game.torrent"
)
echo The game has been installed!
echo.
echo.
echo :: SETUP CLEAN-UP
echo.
del boiii.zip >nul
del t7_full_game.torrent >nul
del t7_full_game.aria2 >nul
del aria2c.exe >nul
echo Clean-up finished!!, auto closing...
start ./t7_full_game/boiii.exe
echo.
pause

