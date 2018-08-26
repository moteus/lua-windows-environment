@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION ENABLEEXTENSIONS

SET LUAROCKS_PATH=c:\luarocks\x86\LuaRocks
SET LUA_EXECUTABLE=c:\luarocks\x86\5.3\bin\lua53.exe

SET "LUA_PATH=%LUAROCKS_PATH%\lua\?.lua;%LUAROCKS_PATH%\lua\?\init.lua;%LUA_PATH%"
IF NOT "%LUA_PATH_5_2%"=="" (
   SET "LUA_PATH_5_2=%LUAROCKS_PATH%\lua\?.lua;%LUAROCKS_PATH%\lua\?\init.lua;%LUA_PATH_5_2%"
)
IF NOT "%LUA_PATH_5_3%"=="" (
   SET "LUA_PATH_5_3=%LUAROCKS_PATH%\lua\?.lua;%LUAROCKS_PATH%\lua\?\init.lua;%LUA_PATH_5_3%"
)
SET "PATH=%LUAROCKS_PATH%;%PATH%"
"%LUA_EXECUTABLE%" "%LUAROCKS_PATH%\luarocks-admin" %*
SET EXITCODE=%ERRORLEVEL%
IF NOT "%EXITCODE%"=="2" GOTO EXITLR

REM Permission denied error, try and auto elevate...
REM already an admin? (checking to prevent loops)
NET SESSION >NUL 2>&1
IF "%ERRORLEVEL%"=="0" GOTO EXITLR

REM Do we have PowerShell available?
PowerShell /? >NUL 2>&1
IF NOT "%ERRORLEVEL%"=="0" GOTO EXITLR

:GETTEMPNAME
SET TMPFILE=%TEMP%\LuaRocks-Elevator-%RANDOM%.bat
IF EXIST "%TMPFILE%" GOTO :GETTEMPNAME 

ECHO @ECHO OFF                                  >  "%TMPFILE%"
ECHO CHDIR /D %CD%                              >> "%TMPFILE%"
ECHO ECHO %0 %*                                 >> "%TMPFILE%"
ECHO ECHO.                                      >> "%TMPFILE%"
ECHO CALL %0 %*                                 >> "%TMPFILE%"
ECHO ECHO.                                      >> "%TMPFILE%"
ECHO ECHO Press any key to close this window... >> "%TMPFILE%"
ECHO PAUSE ^> NUL                               >> "%TMPFILE%"
ECHO DEL "%TMPFILE%"                            >> "%TMPFILE%"

ECHO Now retrying as a privileged user...
PowerShell -Command (New-Object -com 'Shell.Application').ShellExecute('%TMPFILE%', '', '', 'runas')

:EXITLR
exit /b %EXITCODE% 
