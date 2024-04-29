@echo off
setlocal

rem Check if running with administrator privileges
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :run_as_admin
) else (
    echo Requesting administrator privileges...
    goto :get_admin_permission
)

:run_as_admin
echo Hello, I have administrator privileges.
echo I am wait to what to do in administrator privileges.

pause
exit

:get_admin_permission
rem Create a VBScript to request administrator privileges
set "vbs_file=%temp%\run_as_admin.vbs"
echo Set UAC = CreateObject^("Shell.Application"^) > "%vbs_file%"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%vbs_file%"

rem Execute the VBScript to run the batch file as administrator
"%vbs_file%"

rem Clean up the temporary VBScript file
del "%vbs_file%"
exit
