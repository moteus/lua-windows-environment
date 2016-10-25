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

#if RT == "v140"
#define RTName "VCRUNTIME140"
#elif RT == "v100"
#define RTName "MSVCR100"
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

#define SysEnvPath "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"
#define UsrEnvPath "SYSTEM\Environment"

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

; If we need register extensions
PrivilegesRequired=admin

#if Arch=="x64"
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode={#Arch}
#endif

ChangesEnvironment=yes
ChangesAssociations=yes

[Tasks]
Name: "Register"; Description: "Register Lua in system"; Components: Lua51 Lua52 Lua53
Name: "Register\v51"; Description: "Lua 5.1"; Components: Lua51
Name: "Register\v52"; Description: "Lua 5.2"; Components: Lua52
Name: "Register\v53"; Description: "Lua 5.3"; Components: Lua53

[Tasks]
Name: "Assoc"; Description: "Associate file extensions"; Components: Lua51 Lua52 Lua53

Name: "Assoc\lua"; Description: ".LUA"
Name: "Assoc\lua\v51"; Description: "Lua 5.1"; Components: Lua51; Flags: exclusive
Name: "Assoc\lua\v52"; Description: "Lua 5.2"; Components: Lua52; Flags: exclusive
Name: "Assoc\lua\v53"; Description: "Lua 5.3"; Components: Lua53; Flags: exclusive

Name: "Assoc\l51"; Description: ".L51"; Components: Lua51
Name: "Assoc\l52"; Description: ".L52"; Components: Lua52
Name: "Assoc\l53"; Description: ".L53"; Components: Lua53

[Components]
Name: "Lua51"; Description: "Lua 5.1"; Flags: checkablealone; Types: LuaOnly FullDynamic FullStatic
Name: "Lua51\LuaService"; Description: "LuaService for Lua 5.1"; Types: LuaOnly FullDynamic FullStatic
Name: "Lua52"; Description: "Lua 5.2"; Flags: checkablealone; Types: LuaOnly FullDynamic FullStatic
Name: "Lua52\LuaService"; Description: "LuaService for Lua 5.2"; Types: LuaOnly FullDynamic FullStatic
Name: "Lua53"; Description: "Lua53"; Flags: checkablealone; Types: LuaOnly FullDynamic FullStatic
Name: "Lua53\LuaService"; Description: "LuaService for Lua 5.3"; Types: LuaOnly FullDynamic FullStatic

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

[Registry]
; Lua environment

Root: HKLM; Tasks: Register\v51; Subkey: "{#SysEnvPath}"; ValueType: expandsz; ValueName: "LUA_PATH"; ValueData: "!\?.lua;!\?\init.lua;?.lua;?\init.lua;{app}\{#Arch}\5.1\systree\share\lua\5.1\?.lua;{app}\{#Arch}\5.1\systree\share\lua\5.1\?\init.lua"; Flags: uninsdeletevalue
Root: HKLM; Tasks: Register\v51; Subkey: "{#SysEnvPath}"; ValueType: expandsz; ValueName: "LUA_CPATH"; ValueData: "!\?.dll;?.dll;{app}\{#Arch}\5.1\systree\lib\lua\5.1\?.dll"; Flags: uninsdeletevalue

Root: HKLM; Tasks: Register\v52; Subkey: "{#SysEnvPath}"; ValueType: expandsz; ValueName: "LUA_PATH_5_2"; ValueData: "!\?.lua;!\?\init.lua;?.lua;?\init.lua;{app}\{#Arch}\5.2\systree\share\lua\5.2\?.lua;{app}\{#Arch}\5.2\systree\share\lua\5.2\?\init.lua"; Flags: uninsdeletevalue
Root: HKLM; Tasks: Register\v52; Subkey: "{#SysEnvPath}"; ValueType: expandsz; ValueName: "LUA_CPATH_5_2"; ValueData: "!\?.dll;?.dll;{app}\{#Arch}\5.2\systree\lib\lua\5.2\?.dll"; Flags: uninsdeletevalue

Root: HKLM; Tasks: Register\v53; Subkey: "{#SysEnvPath}"; ValueType: expandsz; ValueName: "LUA_PATH_5_3"; ValueData: "!\?.lua;!\?\init.lua;?.lua;?\init.lua;{app}\{#Arch}\5.3\systree\share\lua\5.3\?.lua;{app}\{#Arch}\5.3\systree\share\lua\5.3\?\init.lua"; Flags: uninsdeletevalue
Root: HKLM; Tasks: Register\v53; Subkey: "{#SysEnvPath}"; ValueType: expandsz; ValueName: "LUA_CPATH_5_3"; ValueData: "!\?.dll;?.dll;{app}\{#Arch}\5.3\systree\lib\lua\5.3\?.dll"; Flags: uninsdeletevalue

[Registry]
; File association

; Register applicatins

Root: HKCR; Tasks: Assoc; Subkey: "LuaEnv51{#Arch}"; ValueType: none; Flags: dontcreatekey uninsdeletekey
Root: HKCR; Tasks: Assoc; Subkey: "LuaEnv51{#Arch}\Shell\Open\Command"; ValueType: expandsz; ValueName: ""; ValueData: "{app}\{#Arch}\5.1\bin\lua51.exe ""%1"" %*";

Root: HKCR; Tasks: Assoc; Subkey: "LuaEnv52{#Arch}"; ValueType: none; Flags: dontcreatekey uninsdeletekey
Root: HKCR; Tasks: Assoc; Subkey: "LuaEnv52{#Arch}\Shell\Open\Command"; ValueType: expandsz; ValueName: ""; ValueData: "{app}\{#Arch}\5.1\bin\lua51.exe ""%1"" %*";

Root: HKCR; Tasks: Assoc; Subkey: "LuaEnv53{#Arch}"; ValueType: none; Flags: dontcreatekey uninsdeletekey
Root: HKCR; Tasks: Assoc; Subkey: "LuaEnv53{#Arch}\Shell\Open\Command"; ValueType: expandsz; ValueName: ""; ValueData: "{app}\{#Arch}\5.1\bin\lua51.exe ""%1"" %*";

; Make associations

Root: HKCR; Tasks: Assoc\l51; Subkey: ".l51"; ValueType: none; Flags: dontcreatekey uninsdeletekey
Root: HKCR; Tasks: Assoc\l51; Subkey: ".l51"; ValueType: string; ValueName: ""; ValueData: "LuaEnv51{#Arch}";

Root: HKCR; Tasks: Assoc\l52; Subkey: ".l52"; ValueType: none; Flags: dontcreatekey uninsdeletekey
Root: HKCR; Tasks: Assoc\l52; Subkey: ".l52"; ValueType: string; ValueName: ""; ValueData: "LuaEnv52{#Arch}";

Root: HKCR; Tasks: Assoc\l53; Subkey: ".l53"; ValueType: none; Flags: dontcreatekey uninsdeletekey
Root: HKCR; Tasks: Assoc\l53; Subkey: ".l53"; ValueType: string; ValueName: ""; ValueData: "LuaEnv53{#Arch}";

Root: HKCR; Tasks: Assoc\lua\v51; Subkey: ".lua"; ValueType: none; Flags: dontcreatekey uninsdeletekey
Root: HKCR; Tasks: Assoc\lua\v51; Subkey: ".lua"; ValueType: string; ValueName: ""; ValueData: "LuaEnv51{#Arch}";

Root: HKCR; Tasks: Assoc\lua\v52; Subkey: ".lua"; ValueType: none; Flags: dontcreatekey uninsdeletekey
Root: HKCR; Tasks: Assoc\lua\v52; Subkey: ".lua"; ValueType: string; ValueName: ""; ValueData: "LuaEnv52{#Arch}";

Root: HKCR; Tasks: Assoc\lua\v53; Subkey: ".lua"; ValueType: none; Flags: dontcreatekey uninsdeletekey
Root: HKCR; Tasks: Assoc\lua\v53; Subkey: ".lua"; ValueType: string; ValueName: ""; ValueData: "LuaEnv53{#Arch}";

[Types]
Name: "FullDynamic"; Description: "Full dynamic"
Name: "FullStatic"; Description: "Full static"
Name: "LuaOnly"; Description: "Lua only"
Name: "Custom"; Description: "Custom"; Flags: iscustom

[Code]

#include "iss\FileReplaceString.iss"

procedure FixPath();
begin
  ReplaceStringInCurFile('C:\LuaRocks', '{app}');
  ReplaceStringInCurFile('c:\luarocks', '{app}');

  // Fix runtime name in config-*.lua
  ReplaceStringInCurFile('VCRUNTIME140', '{#RTName}');
  ReplaceStringInCurFile('MSVCR100',     '{#RTName}');
end;

[Code]

#include "iss\Env.iss"

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssPostInstall then begin
    EnvAppend('PATH', '{app}');

    if IsTaskSelected('Register') then begin
      EnvAppend('PATH', '{app}\{#Arch}\LuaRocks');
      EnvAppend('PATH', '{app}\{#Arch}\external\bin');
    end;

    if IsTaskSelected('Register\v51') then begin
      EnvAppend('PATH', '{app}\{#Arch}\5.1\bin');
      EnvAppend('PATH', '{app}\{#Arch}\5.1\systree\bin');
    end;

    if IsTaskSelected('Register\v52') then begin
      EnvAppend('PATH', '{app}\{#Arch}\5.2\bin');
      EnvAppend('PATH', '{app}\{#Arch}\5.2\systree\bin');
    end;

    if IsTaskSelected('Register\v53') then begin
      EnvAppend('PATH', '{app}\{#Arch}\5.3\bin');
      EnvAppend('PATH', '{app}\{#Arch}\5.3\systree\bin');
    end;

    if IsTaskSelected('Assoc\lua') then EnvAppend('PATHEXT', '.LUA');
    if IsTaskSelected('Assoc\l51') then EnvAppend('PATHEXT', '.L51');
    if IsTaskSelected('Assoc\l52') then EnvAppend('PATHEXT', '.L52');
    if IsTaskSelected('Assoc\l53') then EnvAppend('PATHEXT', '.L53');

  end
end;

procedure CurUninstallStepChanged(CurStep: TUninstallStep);
begin
  if CurStep = usUninstall then begin
    EnvRemove('PATH', '{app}');
    EnvRemove('PATH', '{app}\{#Arch}\LuaRocks');
    EnvRemove('PATH', '{app}\{#Arch}\external\bin');
    EnvRemove('PATH', '{app}\{#Arch}\5.1\bin');
    EnvRemove('PATH', '{app}\{#Arch}\5.1\systree\bin');
    EnvRemove('PATH', '{app}\{#Arch}\5.2\bin');
    EnvRemove('PATH', '{app}\{#Arch}\5.2\systree\bin');
    EnvRemove('PATH', '{app}\{#Arch}\5.3\bin');
    EnvRemove('PATH', '{app}\{#Arch}\5.3\systree\bin');

    EnvRemove('PATHEXT', '.LUA');
    EnvRemove('PATHEXT', '.L51');
    EnvRemove('PATHEXT', '.L52');
    EnvRemove('PATHEXT', '.L53');
  end
end;
