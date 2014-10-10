IF NOT DEFINED SPN set SPN=spoon
IF "%1" == "" (
   echo "Expect a version. Use this command like: build version. Example build 9.2.3.v20140905"
   exit /b 1
)
set VERSION=%1
%SPN% build --name=jetty:%VERSION% spoon.me