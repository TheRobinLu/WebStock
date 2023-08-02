@echo off
setlocal

rem MySQL credentials
set mysql_user=root
set mysql_password=TToomm7&
set database=stock

REM Get the current date and time
for /f "tokens=1-4 delims=/ " %%a in ('date /t') do (
    set "month=%%a"
    set "day=%%b"
    set "year=%%c"
)
for /f "tokens=1-2 delims=: " %%a in ('time /t') do (
    set "hour=%%a"
    set "minute=%%b"
)

rem Output file
set output_file=%database%_ddl_%year%%month%%day%-%hour%%minute%.sql

rem MySQL dump command
set mysqldump_cmd=mysqldump -u%mysql_user% -p --no-data --routines --triggers %database%

rem Execute the MySQL dump command and save the output to the specified file
%mysqldump_cmd% > "%output_file%"

echo Schema DDL exported to %output_file%

endlocal