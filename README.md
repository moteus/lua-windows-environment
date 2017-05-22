
[![Download x86](https://img.shields.io/badge/Download-x86-blue.svg)](https://ci.appveyor.com/api/projects/moteus/lua-windows-environment/artifacts/LuaEnv-x86-0.1.0.exe?branch=master)
[![Download x64](https://img.shields.io/badge/Download-x64-blue.svg)](https://ci.appveyor.com/api/projects/moteus/lua-windows-environment/artifacts/LuaEnv-x64-0.1.0.exe?branch=master)

This is my basic installation which allows me easy switch beetween Lua versions.
To be able install binary rocks also need install MS compiler.
You can install as part of Microsoft Visual Studio or as part of Microsoft SDK
or as part of Microsoft Build Tools.

![Screenshot](image/luaver.gif)

### Manual install
 * Copy `luarocks` directory on `c:` drive.
 * Copy Lua binaries/lib/include files to appropriate folder.
    e.g. If you want install Lua 5.3 win MSVC 10 for x86
     - copy .\Lua\5.3\Win32\v100\bin to c:\LuaRocks\x86\5.3\bin
     - copy .\Lua\5.3\Win32\v100\lib to c:\LuaRocks\x86\5.3\lib
     - copy .\Lua\5.3\Win32\include to c:\LuaRocks\x86\5.3\include
 * 
 * To configure environment you can lanch 
  ```
  luaenv x86 5.3
  ```
 * To see what need set in environment to install this version as default
  ```
  luaenv x86 5.3 config
  ```
 * To install external deps
   - put `lib` files to `external/lib` directory
   - put `*.h` files to `external/include` directory
   - put `*.dll` files to `external/bin` directory

### Notes about path
  To change path from `C:\LuaRocks` need change path in
  * `\luarocks\luaenv.bat`
  * `\luarocks\*\LuaRocks\config-*.lua`
  * `\luarocks\*\LuaRocks\luarocks-*.bat`
  * `\luarocks\*\LuaRocks\luarocks-admin-*.bat`
  * `\luarocks\*\LuaRocks\lua\luarocks\site_config.lua`
