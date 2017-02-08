:: File mas2j.bat
@ECHO OFF

IF [%1]==[] (
  echo File %1 not found
  exit
)

:: Use local variables

SETLOCAL
FOR %%F IN ("%0") DO SET _CURDIR=%%~dpF
SET _JASONDIR=%_CURDIR%\..
SET _JASONLIB=%_JASONDIR%\bin
SET _PROJECTPATH="%~dp1\"
cd %_CURDIR%

%_JASONDIR%\ant\bin\ant.bat -f %_PROJECTPATH%bin\build.xml
java -classpath .;bin\classes;%JASONLIB%\jason.jar jason.mas2j.parser.mas2j  %1 ::<the .mas2j file [full path]>
