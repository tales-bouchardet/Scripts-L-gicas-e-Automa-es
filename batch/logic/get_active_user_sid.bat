@echo off
setlocal enabledelayedexpansion
 
for /f "tokens=1" %%A in ('query user ^| findstr /I /R "Ativo Active"') do (
    set RAWUSER=%%A
)
 
set USER=!RAWUSER!
set USER=!USER:~1!
 
for /f %%i in ('powershell -Command "(Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\*' | Where-Object { $_.ProfileImagePath -eq 'C:\Users\%USER%' }).PSChildName"') do set SID=%%i

echo %SID%

pause
