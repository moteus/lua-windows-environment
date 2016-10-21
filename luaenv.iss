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

Name: "External"; Description: "External libraries"
; cURL
Name: "External\curl"; Description: "cURL"
Name: "External\curl\ossl"; Description: "DLL OpenSSL"; Flags: exclusive
Name: "External\curl\sspi"; Description: "DLL WinSSPI"; Flags: exclusive

; Expat
Name: "External\expat"; Description: "Expat"
Name: "External\expat\dynamic"; Description: "Dynamic"; Flags: exclusive
Name: "External\expat\static";  Description: "Static"; Flags: exclusive

; iconv
Name: "External\iconv"; Description: "iconv"
Name: "External\iconv\dynamic"; Description: "Dynamic"; Flags: exclusive
Name: "External\iconv\static";  Description: "Static"; Flags: exclusive

; libffi
#if Arch == "x86"
Name: "External\libffi"; Description: "libffi"
Name: "External\libffi\static";  Description: "Static"; Flags: exclusive
#endif

; libuv
Name: "External\libuv"; Description: "libuv"
Name: "External\libuv\dynamic"; Description: "Dynamic"; Flags: exclusive
Name: "External\libuv\static";  Description: "Static"; Flags: exclusive

; pcre
Name: "External\pcre"; Description: "PCRE"
Name: "External\pcre\dynamic"; Description: "Dynamic"; Flags: exclusive
Name: "External\pcre\static";  Description: "Static"; Flags: exclusive

; SQLite
Name: "External\SQLite"; Description: "SQLite"
Name: "External\SQLite\dynamic"; Description: "Dynamic"; Flags: exclusive
Name: "External\SQLite\static";  Description: "Static"; Flags: exclusive

; zlib
Name: "External\zlib"; Description: "zlib"
Name: "External\zlib\dynamic"; Description: "Dynamic"; Flags: exclusive
Name: "External\zlib\static";  Description: "Static"; Flags: exclusive

; ZeroMQ
Name: "External\ZeroMQ"; Description: "ZeroMQ"
Name: "External\ZeroMQ\dynamic"; Description: "Dynamic"; Flags: exclusive

; libsodium
Name: "External\libsodium"; Description: "libsodium"
Name: "External\libsodium\dynamic"; Description: "Dynamic"; Flags: exclusive

; OpenSSL
Name: "External\OpenSSL"; Description: "OpenSSL"
Name: "External\OpenSSL\v1_0"; Description: "1.0.x"; Flags: exclusive
Name: "External\OpenSSL\v1_0\dynamic"; Description: "Dynamic"; Flags: exclusive
Name: "External\OpenSSL\v1_0\static"; Description: "Static"; Flags: exclusive
Name: "External\OpenSSL\v1_1"; Description: "1.1.x"; Flags: exclusive
Name: "External\OpenSSL\v1_1\dynamic"; Description: "Dynamic"; Flags: exclusive

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

; External deps

[Files]
; ==========================================================================
; External dep - curl
; ==========================================================================
Source: "{#ROOT}\libs\curl\lic\*"; DestDir: "{app}\{#Arch}\external\lic\curl"; Flags: recursesubdirs; Components: External\curl
Source: "{#ROOT}\libs\curl\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\curl

; External dep - curl OpenSSL
Source: "{#ROOT}\libs\curl\{#ArchName}\{#RT}\DLL Release - DLL OpenSSL\curl.exe"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\curl\ossl
Source: "{#ROOT}\libs\curl\{#ArchName}\{#RT}\DLL Release - DLL OpenSSL\libcurl.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\curl\ossl
Source: "{#ROOT}\libs\curl\{#ArchName}\{#RT}\DLL Release - DLL OpenSSL\libcurl.lib"; DestDir: "{app}\{#Arch}\external\lib"; Components: External\curl\ossl

; External dep - curl WinSSPI
Source: "{#ROOT}\libs\curl\{#ArchName}\{#RT}\DLL Release - DLL Windows SSPI\curl.exe"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\curl\sspi
Source: "{#ROOT}\libs\curl\{#ArchName}\{#RT}\DLL Release - DLL Windows SSPI\libcurl.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\curl\sspi
Source: "{#ROOT}\libs\curl\{#ArchName}\{#RT}\DLL Release - DLL Windows SSPI\libcurl.lib"; DestDir: "{app}\{#Arch}\external\lib"; Components: External\curl\sspi

[Files]
; ==========================================================================
; External dep - expat
; ==========================================================================
Source: "{#ROOT}\libs\expat\lic\*"; DestDir: "{app}\{#Arch}\external\lic\Expat"; Flags: recursesubdirs; Components: External\expat
Source: "{#ROOT}\libs\expat\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\expat

; External dep - expat dynamic
Source: "{#ROOT}\libs\expat\{#ArchName}\{#RT}\dynamic\libexpat.lib"; DestDir: "{app}\{#Arch}\external\lib"; DestName: expat.lib; Components: External\expat\dynamic
Source: "{#ROOT}\libs\expat\{#ArchName}\{#RT}\dynamic\*.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\expat\dynamic
Source: "{#ROOT}\libs\expat\{#ArchName}\{#RT}\dynamic\*.exe"; DestDir: "{app}\{#Arch}\external\bin"; Flags: skipifsourcedoesntexist; Components: External\expat\dynamic

; External dep - expat static
Source: "{#ROOT}\libs\expat\{#ArchName}\{#RT}\static\libexpat.lib"; DestDir: "{app}\{#Arch}\external\lib"; DestName: expat.lib; Components: External\expat\static
Source: "{#ROOT}\libs\expat\{#ArchName}\{#RT}\static\*.exe"; DestDir: "{app}\{#Arch}\external\bin"; Flags: skipifsourcedoesntexist; Components: External\expat\static

[Files]
; ==========================================================================
; External dep - iconv
; ==========================================================================
Source: "{#ROOT}\libs\iconv\lic\*"; DestDir: "{app}\{#Arch}\external\lic\iconv"; Flags: recursesubdirs; Components: External\iconv
Source: "{#ROOT}\libs\iconv\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\iconv

; External dep - iconv dynamic
Source: "{#ROOT}\libs\iconv\{#ArchName}\{#RT}\dynamic\libiconv.lib"; DestDir: "{app}\{#Arch}\external\lib"; DestName: iconv.lib; Components: External\iconv\dynamic
Source: "{#ROOT}\libs\iconv\{#ArchName}\{#RT}\dynamic\*.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\iconv\dynamic

; External dep - iconv static
Source: "{#ROOT}\libs\iconv\{#ArchName}\{#RT}\static\libiconv.lib"; DestDir: "{app}\{#Arch}\external\lib"; DestName: iconv.lib; Components: External\iconv\static

[Files]
; ==========================================================================
; External dep - libffi
; ==========================================================================
#if Arch == "x86"

Source: "{#ROOT}\libs\libffi\lic\*"; DestDir: "{app}\{#Arch}\external\lic\libffi"; Flags: recursesubdirs; Components: External\libffi
Source: "{#ROOT}\libs\libffi\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\libffi

; External dep - libffi static
Source: "{#ROOT}\libs\libffi\{#ArchName}\{#RT}\static\libffi.lib"; DestDir: "{app}\{#Arch}\external\lib"; DestName: ffi.lib; Components: External\libffi\static

#endif

[Files]
; ==========================================================================
; External dep - libuv
; ==========================================================================
Source: "{#ROOT}\libs\libuv\lic\*"; DestDir: "{app}\{#Arch}\external\lic\libuv"; Flags: recursesubdirs; Components: External\libuv
Source: "{#ROOT}\libs\libuv\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\libuv

; External dep - libuv dynamic
Source: "{#ROOT}\libs\libuv\{#ArchName}\{#RT}\dynamic\libuv.lib"; DestDir: "{app}\{#Arch}\external\lib"; DestName: libuv.lib; Components: External\libuv\dynamic
Source: "{#ROOT}\libs\libuv\{#ArchName}\{#RT}\dynamic\*.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\libuv\dynamic
Source: "{#ROOT}\libs\libuv\{#ArchName}\{#RT}\dynamic\*.exe"; DestDir: "{app}\{#Arch}\external\bin"; Flags: skipifsourcedoesntexist; Components: External\libuv\dynamic

; External dep - libuv static
Source: "{#ROOT}\libs\libuv\{#ArchName}\{#RT}\static\libuv.lib"; DestDir: "{app}\{#Arch}\external\lib"; DestName: libuv.lib; Components: External\libuv\static
Source: "{#ROOT}\libs\libuv\{#ArchName}\{#RT}\static\*.exe"; DestDir: "{app}\{#Arch}\external\bin"; Flags: skipifsourcedoesntexist; Components: External\libuv\static

[Files]
; ==========================================================================
; External dep - pcre
; ==========================================================================
Source: "{#ROOT}\libs\pcre\lic\*"; DestDir: "{app}\{#Arch}\external\lic\pcre"; Flags: recursesubdirs; Components: External\pcre
Source: "{#ROOT}\libs\pcre\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\pcre

; External dep - pcre dynamic
Source: "{#ROOT}\libs\pcre\{#ArchName}\{#RT}\dynamic\*.lib"; DestDir: "{app}\{#Arch}\external\lib"; Components: External\pcre\dynamic
Source: "{#ROOT}\libs\pcre\{#ArchName}\{#RT}\dynamic\*.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\pcre\dynamic

; External dep - pcre static
Source: "{#ROOT}\libs\pcre\{#ArchName}\{#RT}\static\*.lib"; DestDir: "{app}\{#Arch}\external\lib"; Components: External\pcre\static

[Files]
; ==========================================================================
; External dep - SQLite
; ==========================================================================
Source: "{#ROOT}\libs\SQLite\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\SQLite

; External dep - SQLite dynamic
Source: "{#ROOT}\libs\SQLite\{#ArchName}\{#RT}\dynamic\*.lib"; DestDir: "{app}\{#Arch}\external\lib"; Components: External\SQLite\dynamic
Source: "{#ROOT}\libs\SQLite\{#ArchName}\{#RT}\dynamic\*.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\SQLite\dynamic
Source: "{#ROOT}\libs\SQLite\{#ArchName}\{#RT}\dynamic\*.exe"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\SQLite\dynamic

; External dep - SQLite static
Source: "{#ROOT}\libs\SQLite\{#ArchName}\{#RT}\static\*.lib"; DestDir: "{app}\{#Arch}\external\lib"; Components: External\SQLite\static
Source: "{#ROOT}\libs\SQLite\{#ArchName}\{#RT}\static\*.exe"; DestDir: "{app}\{#Arch}\external\bin"; Flags: skipifsourcedoesntexist; Components: External\SQLite\static

[Files]
; ==========================================================================
; External dep - zlib
; ==========================================================================
Source: "{#ROOT}\libs\zlib\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\zlib

; External dep - zlib dynamic
Source: "{#ROOT}\libs\zlib\{#ArchName}\{#RT}\dynamic\zdll.lib"; DestDir: "{app}\{#Arch}\external\lib"; DestName: z.lib; Components: External\zlib\dynamic
Source: "{#ROOT}\libs\zlib\{#ArchName}\{#RT}\dynamic\zlib1.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\zlib\dynamic

; External dep - zlib static
Source: "{#ROOT}\libs\zlib\{#ArchName}\{#RT}\static\zlib.lib"; DestDir: "{app}\{#Arch}\external\lib"; DestName: z.lib; Components: External\zlib\static

[Files]
; ==========================================================================
; External dep - ZeroMQ
; ==========================================================================
Source: "{#ROOT}\libs\ZeroMQ\lic\*"; DestDir: "{app}\{#Arch}\external\lic\ZeroMQ"; Flags: recursesubdirs; Components: External\ZeroMQ
Source: "{#ROOT}\libs\ZeroMQ\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\ZeroMQ

; External dep - ZeroMQ dynamic
Source: "{#ROOT}\libs\ZeroMQ\{#ArchName}\{#RT}\dynamic\libzmq.lib"; DestDir: "{app}\{#Arch}\external\lib"; Components: External\ZeroMQ\dynamic
Source: "{#ROOT}\libs\ZeroMQ\{#ArchName}\{#RT}\dynamic\libzmq.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\ZeroMQ\dynamic

[Files]
; ==========================================================================
; External dep - libsodium
; ==========================================================================
Source: "{#ROOT}\libs\libsodium\lic\*"; DestDir: "{app}\{#Arch}\external\lic\libsodium"; Flags: recursesubdirs; Components: External\libsodium
Source: "{#ROOT}\libs\libsodium\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\libsodium

; External dep - libsodium dynamic
Source: "{#ROOT}\libs\libsodium\{#ArchName}\{#RT}\dynamic\libsodium.lib"; DestDir: "{app}\{#Arch}\external\lib"; Components: External\libsodium\dynamic
Source: "{#ROOT}\libs\libsodium\{#ArchName}\{#RT}\dynamic\libsodium.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\libsodium\dynamic


[Files]
; ==========================================================================
; External dep - OpenSSL
; ==========================================================================

; External dep - OpenSSL 1.0 dynamic
Source: "{#ROOT}\libs\openssl\1.0.2h\{#ArchName}\{#RT}\dynamic\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\OpenSSL\v1_0\dynamic
Source: "{#ROOT}\libs\openssl\1.0.2h\{#ArchName}\{#RT}\dynamic\lib\*"; DestDir: "{app}\{#Arch}\external\lib"; Flags: recursesubdirs; Components: External\OpenSSL\v1_0\dynamic
Source: "{#ROOT}\libs\openssl\1.0.2h\{#ArchName}\{#RT}\dynamic\bin\*"; DestDir: "{app}\{#Arch}\external\bin"; Flags: recursesubdirs; Components: External\OpenSSL\v1_0\dynamic

; External dep - OpenSSL 1.0 static
Source: "{#ROOT}\libs\openssl\1.0.2h\{#ArchName}\{#RT}\static\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\OpenSSL\v1_0\static
Source: "{#ROOT}\libs\openssl\1.0.2h\{#ArchName}\{#RT}\static\lib\*"; DestDir: "{app}\{#Arch}\external\lib"; Flags: recursesubdirs; Components: External\OpenSSL\v1_0\static
Source: "{#ROOT}\libs\openssl\1.0.2h\{#ArchName}\{#RT}\static\bin\*"; DestDir: "{app}\{#Arch}\external\bin"; Flags: recursesubdirs; Components: External\OpenSSL\v1_0\static

; External dep - OpenSSL 1.1
Source: "{#ROOT}\libs\openssl\1.1.0\lic\*"; DestDir: "{app}\{#Arch}\external\lic\openssl"; Flags: recursesubdirs; Components: External\OpenSSL\v1_1
Source: "{#ROOT}\libs\openssl\1.1.0\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\OpenSSL\v1_1
Source: "{#ROOT}\libs\openssl\1.1.0\{#ArchName}\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\OpenSSL\v1_1

; External dep - OpenSSL 1.1 dynamic
Source: "{#ROOT}\libs\openssl\1.1.0\{#ArchName}\{#RT}\dynamic\*.lib"; DestDir: "{app}\{#Arch}\external\lib"; Flags: recursesubdirs; Components: External\OpenSSL\v1_1\dynamic
Source: "{#ROOT}\libs\openssl\1.1.0\{#ArchName}\{#RT}\dynamic\*.dll"; DestDir: "{app}\{#Arch}\external\bin"; Flags: recursesubdirs; Components: External\OpenSSL\v1_1\dynamic
Source: "{#ROOT}\libs\openssl\1.1.0\{#ArchName}\{#RT}\dynamic\*.exe"; DestDir: "{app}\{#Arch}\external\bin"; Flags: recursesubdirs; Components: External\OpenSSL\v1_1\dynamic

[Files]

; External dep - libmemcached-win32
; External dep - libyaml

[Code]

#include "iss\FileReplaceString.iss"

procedure FixPath();
begin
  ReplaceStringInCurFile('C:\LuaRocks', '{app}');
  ReplaceStringInCurFile('c:\luarocks', '{app}');
end;
