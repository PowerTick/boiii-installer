::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWH3eyGUxJR5HcCatFUKTOrQO4emp7KSCukh9
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
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
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCuDJH6F+UcjFDl7ZS2rAGm1D7wV1+H1/P6GrkEYRqw6YIq7
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
aria2c --seed-time=0 -s16 -x16 --file-allocation=trunc --download-result=hide --summary-interval=0 --console-log-level=warn --log-level=warn --console-log-level=error ".\t7_full_game.torrent"
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
