echo "Testing Jetty Now"

IF NOT DEFINED JETTY_HOME (
	echo "%%JETTY_HOME%% is missing"
	exit /b 1
)
IF NOT DEFINED WEB_APPS (
	echo "%%WEB_APPS%% is missing"
	exit /b 2
)

IF NOT EXIST %JETTY_HOME%\start.jar (
	echo "%%JETTY_HOME%%\start.jar"
	exit /b 3
)
