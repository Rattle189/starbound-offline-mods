@echo off

rem This script must be placed in your Starbound directory. It will exit out the directory twice (assuming the directory tree is steamapps/common/Starbound) and then enter the workshop folder from the steamapps folder.

set workshop=%~dp0..\..\workshop\content\211820
set mods=%~dp0mods
 
for /D %%i in ("%workshop%\*") do (
    for %%j in ("%%~fi\*.pak") do (
        del "%mods%\%%~ni_%%~nj.pak" >nul 2>nul
        mklink "%mods%\%%~ni_%%~nj.pak" "%%j" 2>nul
    )
)
echo.
if %errorlevel% NEQ 0 echo *** ERROR! You have to run this file as administrator! ***
if %errorlevel% NEQ 0 echo *** If you are getting this error even on administrator, please create a 'mods' folder ***
 
pause
