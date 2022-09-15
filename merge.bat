@echo off

if not defined PYTHON (set PYTHON=python)
if not defined VENV_DIR (set VENV_DIR=..\venv)

:activate_venv
set PYTHON="%~dp0%VENV_DIR%\Scripts\Python.exe"
echo venv %PYTHON%

:ask1
set /p filename1="Enter the name of the first file: "
if not exist %filename1% (
    echo "File does not exist"
    goto :ask1
)
if exist %filename1% echo "Ok, using %filename1%"

:ask2
set /p filename2="Enter the name of the second file: "
if not exist %filename2% (
    echo "File does not exist"
    goto :ask2
)
if %filename2% == %filename1% (
    echo "Files must be different"
    goto :ask2
)
if exist %filename2% echo "Ok, using %filename2%"

:ask_alpha
set "alpha=0.5"
echo "Enter alpha value (0.0-1.0)."
set /p alpha="Or press [ENTER] for default [%alpha%]: "

:ask_filename
set "output=merged"
echo "Enter output filename without file extension."
set /p output="Or press [ENTER] for default [%output%]: "

:launch
%PYTHON% merge.py %filename1% %filename2% --alpha %alpha% --output %output%
pause
exit /b