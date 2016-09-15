@echo off

if not "%1"=="x86" if not "%1"=="x64" goto :usage

if not "%2"=="5.1" if not "%2"=="5.2" if not "%2"=="5.3" goto :usage

if "%3"=="config" (
  SETLOCAL
  goto :init
)

:: Remove preview variables from PATH variable

setlocal enabledelayedexpansion

set CLEAN_PATH=
set t=%PATH%

:loop
for /f "tokens=1* delims=;" %%a in ("%t%") do (
  set t=%%b
  if "%%a"=="%LUA_DIR%\bin"               goto :end_loop
  if "%%a"=="%LUA_DIR%\systree\bin"       goto :end_loop
  if "%%a"=="%LUA_ARCH_DIR%\LuaRocks"     goto :end_loop
  if "%%a"=="%LUA_ARCH_DIR%\external\bin" goto :end_loop
  set b=%%a
)

if not "%CLEAN_PATH%"=="" set CLEAN_PATH=!CLEAN_PATH!;
set CLEAN_PATH=%CLEAN_PATH%%b%

:end_loop
if defined t goto :loop

endlocal && set PATH=%CLEAN_PATH%

:init

set LUA_ARCH=%1
set LUA_VER=%2
set LUA_BASE=C:\LuaRocks

set LUA_ARCH_DIR=%LUA_BASE%\%LUA_ARCH%
set LUA_DIR=%LUA_ARCH_DIR%\%LUA_VER%
set LUA_SYSTEM_PATH=%LUA_DIR%\bin;%LUA_DIR%\systree\bin;%LUA_ARCH_DIR%\LuaRocks;%LUA_ARCH_DIR%\external\bin

set LUA_INIT=
set LUA_PATH=!\?.lua;!\?\init.lua;?.lua;?\init.lua;%LUA_DIR%\systree\share\lua\%LUA_VER%\?.lua;%LUA_DIR%\systree\share\lua\%LUA_VER%\?\init.lua
set LUA_CPATH=!\?.dll;?.dll;%LUA_DIR%\systree\lib\lua\%LUA_VER%\?.dll
set PATH=%LUA_SYSTEM_PATH%;%PATH%

if "%3"=="config" (
  echo  configuration:
  echo  PATH: %LUA_SYSTEM_PATH%
  echo  LUA_PATH: %LUA_PATH%
  echo  LUA_CPATH: %LUA_CPATH%
  ENDLOCAL
  goto end
)

doskey luarocks-admin=%LUA_ARCH_DIR%\LuaRocks\luarocks-admin-%LUA_VER%.bat $*
doskey luarocks=%LUA_ARCH_DIR%\LuaRocks\luarocks-%LUA_VER%.bat $*
doskey lua=%LUA_DIR%\bin\lua%LUA_VER:~0,1%%LUA_VER:~-1,1%.exe $*

echo ==========================================
echo  Set Lua %LUA_VER%/%LUA_ARCH% environment
echo  Lua path: %LUA_DIR%\bin
echo  LuaRocks path: %LUA_ARCH_DIR%\LuaRocks
echo ==========================================
goto :end

:usage
echo Usage:
echo   luaenv ARCH VERSION config
echo.
echo arguments:
echo   ARCH             target CPU architecture
echo                    supported value: x86/x64
echo   VERSION          Lua version
echo                    supported value: 5.1/5.2/5.3
echo.

:end
