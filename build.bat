IF NOT DEFINED SPN set SPN=spoon
IF "%1" == "" (
   echo "Picking up version from autobuild.version.txt. You can overwrite the version by calling build.bat 9.2.3.v20140905"
   SET /p VERSION=<autobuild.version.txt
) ELSE (
	set VERSION=%1
)
%SPN% build --name=jetty:%VERSION% spoon.me