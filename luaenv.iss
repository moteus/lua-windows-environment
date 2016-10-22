#ifndef Arch
#define Arch       "x86"
#endif

#ifndef RT

#if Arch == "x86"
#define RT         "v100"
#else
#define RT         "v140"
#endif

#endif

#if Arch == "x86"
#define ArchName  "Win32"
#else
#define ArchName  "x64"
#endif

#ifndef ROOT
#define ROOT "."
#endif

#define   Version     "0.1.0"
#define   Name        "LuaEnv"
#define   URL         "https://github.com/moteus/lua-windows-environment"
#define   Copyright   
#define   Publisher   "Alexey Melnichuk"

[Setup]
AppId={#Name}-{#Arch}

LicenseFile=

AppName={#Name}
AppVersion={#Version}
AppPublisher={#Publisher}
AppPublisherURL={#URL}
AppCopyright={#Copyright}
AppSupportURL={#URL}
AppUpdatesURL={#URL}

DefaultDirName={sd}\luaenv
DefaultGroupName={#Name}

OutputDir=.
OutputBaseFileName={#Name}-{#Arch}-{#Version}

SetupIconFile=

Compression=lzma
SolidCompression=yes

; We install Services
PrivilegesRequired=admin

#if Arch=="x64"
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode={#Arch}
#endif

[Components]
Name: "Lua51"; Description: "Lua 5.1"; Flags: checkablealone
Name: "Lua51\LuaService"; Description: "LuaService for Lua 5.1"
Name: "Lua52"; Description: "Lua 5.2"; Flags: checkablealone
Name: "Lua52\LuaService"; Description: "LuaService for Lua 5.2"
Name: "Lua53"; Description: "Lua53"; Flags: checkablealone
Name: "Lua53\LuaService"; Description: "LuaService for Lua 5.3"

[Components]
; External components
Name: "External"; Description: "External libraries"

#include ROOT + "\libs\curl\setup.iss"
#include ROOT + "\libs\expat\setup.iss"
#include ROOT + "\libs\iconv\setup.iss"
#include ROOT + "\libs\libffi\setup.iss"
#include ROOT + "\libs\libmemcached-win32\setup.iss"
#include ROOT + "\libs\libsodium\setup.iss"
#include ROOT + "\libs\libuv\setup.iss"
#include ROOT + "\libs\libyaml\setup.iss"
#include ROOT + "\libs\OpenSSL\setup.iss"
#include ROOT + "\libs\pcre\setup.iss"
#include ROOT + "\libs\SQLite\setup.iss"
#include ROOT + "\libs\ZeroMQ\setup.iss"
#include ROOT + "\libs\zlib\setup.iss"

[Files]
; Lua 5.1 binaries
Source: "{#ROOT}\Lua\5.1\{#ArchName}\{#RT}\*"; DestDir: "{app}\{#Arch}\5.1"; Flags: recursesubdirs; Components: Lua51
Source: "{#ROOT}\Lua\5.1\include\*"; DestDir: "{app}\{#Arch}\5.1\include"; Components: Lua51
Source: "{#ROOT}\LuaService\{#ArchName}\{#RT}\5.1\*"; DestDir: "{app}\{#Arch}\5.1\bin"; Components: Lua51\LuaService

; Lua 5.2 binaries
Source: "{#ROOT}\Lua\5.2\{#ArchName}\{#RT}\*"; DestDir: "{app}\{#Arch}\5.2"; Flags: recursesubdirs; Components: Lua52
Source: "{#ROOT}\Lua\5.2\include\*"; DestDir: "{app}\{#Arch}\5.2\include"; Components: Lua52
Source: "{#ROOT}\LuaService\{#ArchName}\{#RT}\5.2\*"; DestDir: "{app}\{#Arch}\5.2\bin"; Components: Lua52\LuaService

; Lua 5.3 binaries
Source: "{#ROOT}\Lua\5.3\{#ArchName}\{#RT}\*"; DestDir: "{app}\{#Arch}\5.3"; Flags: recursesubdirs; Components: Lua53
Source: "{#ROOT}\Lua\5.3\include\*"; DestDir: "{app}\{#Arch}\5.3\include"; Components: Lua53
Source: "{#ROOT}\LuaService\{#ArchName}\{#RT}\5.3\*"; DestDir: "{app}\{#Arch}\5.3\bin"; Components: Lua53\LuaService

; LuaRocks
Source: "{#ROOT}\luarocks\{#Arch}\LuaRocks\*"; DestDir: "{app}\{#Arch}\LuaRocks"; Flags: recursesubdirs; Components: Lua51 Lua52 Lua53; Excludes: "config-5.*.lua luarocks-5.*.bat luarocks-admin-5.*.bat site_config.lua"
Source: "{#ROOT}\luarocks\{#Arch}\LuaRocks\lua\luarocks\site_config.lua"; DestDir: "{app}\{#Arch}\LuaRocks\lua\luarocks"; Flags: recursesubdirs; Components: Lua51 Lua52 Lua53; AfterInstall: FixPath

; LuaRocks Lua 5.1 config
Source: "{#ROOT}\luarocks\{#Arch}\LuaRocks\config-5.1.lua"; DestDir: "{app}\{#Arch}\LuaRocks"; Components: Lua51; AfterInstall: FixPath
Source: "{#ROOT}\luarocks\{#Arch}\LuaRocks\luarocks-5.1.bat"; DestDir: "{app}\{#Arch}\LuaRocks"; Components: Lua51; AfterInstall: FixPath
Source: "{#ROOT}\luarocks\{#Arch}\LuaRocks\luarocks-admin-5.1.bat"; DestDir: "{app}\{#Arch}\LuaRocks"; Components: Lua51; AfterInstall: FixPath

; LuaRocks Lua 5.2 config
Source: "{#ROOT}\luarocks\{#Arch}\LuaRocks\config-5.2.lua"; DestDir: "{app}\{#Arch}\LuaRocks"; Components: Lua52; AfterInstall: FixPath
Source: "{#ROOT}\luarocks\{#Arch}\LuaRocks\luarocks-5.2.bat"; DestDir: "{app}\{#Arch}\LuaRocks"; Components: Lua52; AfterInstall: FixPath
Source: "{#ROOT}\luarocks\{#Arch}\LuaRocks\luarocks-admin-5.2.bat"; DestDir: "{app}\{#Arch}\LuaRocks"; Components: Lua52; AfterInstall: FixPath

; LuaRocks Lua 5.3 config
Source: "{#ROOT}\luarocks\{#Arch}\LuaRocks\config-5.3.lua"; DestDir: "{app}\{#Arch}\LuaRocks"; Components: Lua53; AfterInstall: FixPath
Source: "{#ROOT}\luarocks\{#Arch}\LuaRocks\luarocks-5.3.bat"; DestDir: "{app}\{#Arch}\LuaRocks"; Components: Lua53; AfterInstall: FixPath
Source: "{#ROOT}\luarocks\{#Arch}\LuaRocks\luarocks-admin-5.3.bat"; DestDir: "{app}\{#Arch}\LuaRocks"; Components: Lua53; AfterInstall: FixPath

Source: "{#ROOT}\luarocks\luaenv.bat"; DestDir: "{app}"; AfterInstall: FixPath

[Code]

#include "iss\FileReplaceString.iss"

procedure FixPath();
begin
  ReplaceStringInCurFile('C:\LuaRocks', '{app}');
  ReplaceStringInCurFile('c:\luarocks', '{app}');
end;
