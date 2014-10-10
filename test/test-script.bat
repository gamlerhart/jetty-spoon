@echo off
IF NOT DEFINED TO_TEST (
	echo "Expect that %%TO_TEST%% points at the image under test"
	exit /b 1
)
echo "Test Basics"
spoon run --startup-file=%comspec% --working-dir="%CD%" %TO_TEST% /c test-container-environment.bat

IF %ERRORLEVEL% NEQ 0 exit %ERRORLEVEL%

spoon run --working-dir="%CD%" --detach %TO_TEST% helloworld.war
echo "waiting for the server to start up"
rem Win XP doesn't have the timeout or sleep command, this is a workaround for 15 timeout
ping -n 15 localhost 1>nul
spoon run --working-dir="%CD%" --attach wget /c test-war-is-deployed.bat
SET OLD_STATUS=%ERRORLEVEL%
spoon stop --all
IF %OLD_STATUS% NEQ 0 goto exit %OLD_STATUS%