@echo off 

rem https://stackoverflow.com/questions/8797983/can-a-windows-batch-file-determine-its-own-file-name

IF NOT exist ..\%~n0.bat (
   echo ERROR: ..\%~n0.bat does not exist. Modify ..\TEMPLATE_%~n0.bat first and save as ..\%~n0.bat
   pause
   goto END
)

call ..\%~n0 %~dp0

:END
