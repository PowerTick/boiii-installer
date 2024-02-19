@echo off
title BOIII INSTALLER
echo ! ================================= !
echo ! BOIII INSTALLER================== !
echo ! ================================= !
echo.
echo ! ============ Downloading launcher !

if  exist .\t7_full_game\boiii.exe (
	echo ! == Launcher is already downloaded !
)
if not exist .\t7_full_game\ (mkdir t7_full_game)
if not exist .\t7_full_game\boiii.exe (
	aria2c.exe --dir=.\t7_full_game https://web.archive.org/web/20230629141934/https://cdn.discordapp.com/attachments/700527387376353330/1121115413925871716/boiii.exe
	echo The launcher has been DOWNLOADED!
)


echo ! ==== Downloading client resources !

if exist .\boiii.zip (
	echo ! Client resources already downloaded
)

if not exist .\boiii.zip (
	aria2c.exe https://web.archive.org/web/20230629142006/https://reactiongaming.us/community/attachments/boiii-zip.1130/
)


echo ! ===== Installing client resources !

if not exist "%HOMEDRIVE%%HOMEPATH%\AppData\Local\boiii\" (
	echo Expand-Archive -Force "%cd%\boiii.zip" "%HOMEDRIVE%%HOMEPATH%\AppData\Local\boiii\" >%temp%\extracttemp.ps1
	powershell Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser
	powershell -file  %temp%\extracttemp.ps1
	powershell Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope CurrentUser
	echo ! Client resources have been installed
	del %temp%\extracttemp.ps1 >nul
)
echo Getting torrent file for the game files!

echo Downloading game files!
if not exist ".\t7_full_game.torrent" (
	aria2c https://web.archive.org/web/20230629141953/https://reactiongaming.us/community/attachments/t7_full_game-torrent.1119/?hash=9e32d123bf2a6b96e23a3e6935deffd2
)
aria2c ".\t7_full_game.torrent"
echo.
echo.
start .\t7_full_game\boiii.exe


