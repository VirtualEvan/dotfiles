:: File mas2j.bat
@ECHO OFF

IF [%1]==[] (
  echo File %1 not found
  exit
)

:: Use local variables

SETLOCAL
FOR %%F IN ("%0") DO SET _CURDIR=%%~dpF
SET _JASONDIR=%_CURDIR%..
SET _JASONLIB=%_JASONDIR%\lib
SET _PROJECTPATH="%~dp1\"
cd %_CURDIR%

::%_JASONDIR%\ant\bin\ant.bat -f %_PROJECTPATH%bin\build.xml

:: Get .mas2j
for /R %_PROJECTPATH% %%F in (*.mas2j) do set mas2j=%%F

:: %mas2j% -> <the .mas2j file [full path]> (This creates the \bin\build.xml)
java -classpath .;bin\classes;%_JASONLIB%\jason.jar jason.mas2j.parser.mas2j  %mas2j%

:: \bin\build.xml [full path]
java -classpath %_JASONLIB%\ant-launcher.jar org.apache.tools.ant.launch.Launcher -e -f %_PROJECTPATH%\bin\build.xml run

::java -classpath .;bin\classes;%_JASONDIR%\lib\jason.jar;%_JASONDIR%\lib\jade.jar;%_JASONDIR%\lib\c4jason.jar;%_JASONDIR%\lib\cartago.jar;%_JASONDIR%\lib\jacamo.jar;. jason.mas2j.parser.mas2j "%~1" %2
::%_JASONDIR%\ant\bin\ant.bat -f %_PROJECTPATH%bin\build.xml
