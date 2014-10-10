echo "Testing Jetty Now"


call:CanAccess "http://localhost:8080/helloworld/"
call:CanAccess "http://localhost:8080/helloworld/hello.jsp"
call:CanAccess "http://localhost:8080/helloworld/hello"
exit 0
goto:eof

rem Unfortunately wget's exit codes are useless.
rem So we check for success by inspecting the file
:CanAccess
echo "Check if we can access %~1"
%spn_wget% %~1 --tries 3 -O check-file.txt

for /f %%A in ("check-file.txt") do set FILE_SIZE=%%~zA
IF %FILE_SIZE% EQU 0 ( 
    echo "Failed to access %~1" 
    exit 1
)
del check-file.txt
IF EXIST check-file.txt EXIT 1
goto:eof