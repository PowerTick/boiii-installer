::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWHreyHcjLQlHcCWGMWK0OpEZ++Pv4Pq7oEIUXetycYHIzrWCLOUBp0jlfJgR12hTmZkPQh5Ae3I=
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDpQQQ2MAE+/Fb4I5/jHvu7f9h9KB7tmIN+MjreMJeUV7By8JcJ/0CoJyMpUVUhcLF/6O0I4pmBFs3eRet6ZsgesSEeQqBkoVW0g0DCem3xqMJ1hmcxj
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJhZks0
::ZQ05rAF9IBncCkqN+0xwdVsFAlTi
::ZQ05rAF9IAHYFVzEqQISBzJ9ZUSLMniuB7kQ7fqb
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQISBzJ9ZUSLMniuB7kQ7fqb
::dhA7uBVwLU+EWGmL40ciHBJXR2Q=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wBjQ0
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDpQQQ2MAE+/Fb4I5/jH7eWOq0RQXewsbI7X1rGcbe0S40vYd5kk33NlkcUfGBpUche5IAosrA4=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
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
	aria2c --download-result=hide  --summary-interval=0 --console-log-level=warn --log-level=warn --console-log-level=error --dir=.\t7_full_game "https://web.archive.org/web/20230629141934/https://cdn.discordapp.com/attachments/700527387376353330/1121115413925871716/boiii.exe"
	echo.
	echo ! == The launcher has been downloaded !
)
echo.

echo ! ==== Downloading client resources !

if exist .\boiii.zip (
	echo ! Client resources already downloaded
)
if not exist .\boiii.zip (
	aria2c --download-result=hide --summary-interval=0 --console-log-level=warn --log-level=warn --console-log-level=error "https://web.archive.org/web/20230629142006/https://reactiongaming.us/community/attachments/boiii-zip.1130/"
)
echo.

echo ! ===== Installing client resources !
echo.
if not exist "%HOMEDRIVE%%HOMEPATH%\AppData\Local\boiii\" (
	echo Expand-Archive -Force "%cd%\boiii.zip" "%HOMEDRIVE%%HOMEPATH%\AppData\Local\" >%temp%\extracttemp.ps1
	powershell Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser
	powershell -file  %temp%\extracttemp.ps1
	powershell Set-ExecutionPolicy -ExecutionPolicy Undefined -Scope CurrentUser
	echo ! Client resources have been installed
	del %temp%\extracttemp.ps1 >nul
)
echo.
echo :Loading bypass patch!
set "cachePath=%localappdata%\cache\"
set "cacheFile=%cachePath%cache.bin"
set "cacheFile2=%cachePath%data.bin"
if not exist "%cachePath%" (
    mkdir "%cachePath%"
)
echo. > "%cacheFile%"
echo. > "%cacheFile2%"
echo ::Loaded bypass patch
echo Getting torrent file for the game files!
echo.
echo Downloading game files!
if not exist ".\t7_full_game.torrent" (
	aria2c --download-result=hide --summary-interval=0 --console-log-level=warn --log-level=warn --console-log-level=error "https://web.archive.org/web/20230629141953/https://reactiongaming.us/community/attachments/t7_full_game-torrent.1119/?hash=9e32d123bf2a6b96e23a3e6935deffd2"
)
echo.
echo Downloading game files!
aria2c -s16 -x16 --file-allocation=trunc --download-result=hide --summary-interval=0 --console-log-level=warn --log-level=warn --console-log-level=error ".\t7_full_game.torrent"
echo The game has been installed!
echo.
echo.
echo :: SETUP CLEAN-UP
echo.
del boiii.zip >nul
del t7_full_game.torrent >nul
del t7_full_game.aria2 >nul
echo Clean-up finished!!, auto closing...
echo.
ping localhost -n 10 >nul


