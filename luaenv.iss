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
; PrivilegesRequired=admin

#if Arch=="x64"
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode={#Arch}
#endif

ChangesEnvironment=yes
ChangesAssociations=yes

[Tasks]
Name: "SysInstall51"; Description: "Register Lua 5.1 in system"; Components: Lua51

Name: "SysInstall51\assoc"; Description: "Associate file extensions"; Components: Lua51
Name: "SysInstall51\assoc\lua"; Description: ".lua"; Components: Lua51
Name: "SysInstall51\assoc\l51"; Description: ".l51"; Components: Lua51
Name: "SysInstall52"; Description: "Register Lua 5.2 in system"; Components: Lua52
Name: "SysInstall52\assoc"; Description: "Associate file extensions"; Components: Lua52
Name: "SysInstall52\assoc\lua"; Description: ".lua"; Components: Lua52
Name: "SysInstall52\assoc\l52"; Description: ".l52"; Components: Lua52
Name: "SysInstall53"; Description: "Register Lua 5.3 in system"; Components: Lua53
Name: "SysInstall53\assoc"; Description: "Associate file extensions"; Components: Lua53
Name: "SysInstall53\assoc\lua"; Description: ".lua"; Components: Lua53
Name: "SysInstall53\assoc\l53"; Description: ".l53"; Components: Lua53

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

Root: HKLM; Tasks: SysInstall51; Subkey: "{#SysEnvPath}"; ValueType: expandsz; ValueName: "LUA_PATH"; ValueData: "!\?.lua;!\?\init.lua;?.lua;?\init.lua;{app}\{#Arch}\5.1\systree\share\lua\5.1\?.lua;{app}\{#Arch}\5.1\systree\share\lua\5.1\?\init.lua"; Flags: uninsdeletevalue
Root: HKLM; Tasks: SysInstall51; Subkey: "{#SysEnvPath}"; ValueType: expandsz; ValueName: "LUA_CPATH"; ValueData: "!\?.dll;?.dll;{app}\{#Arch}\5.1\systree\lib\lua\5.1\?.dll"; Flags: uninsdeletevalue

Root: HKLM; Tasks: SysInstall52; Subkey: "{#SysEnvPath}"; ValueType: expandsz; ValueName: "LUA_PATH_5_2"; ValueData: "!\?.lua;!\?\init.lua;?.lua;?\init.lua;{app}\{#Arch}\5.2\systree\share\lua\5.2\?.lua;{app}\{#Arch}\5.2\systree\share\lua\5.2\?\init.lua"; Flags: uninsdeletevalue
Root: HKLM; Tasks: SysInstall52; Subkey: "{#SysEnvPath}"; ValueType: expandsz; ValueName: "LUA_CPATH_5_2"; ValueData: "!\?.dll;?.dll;{app}\{#Arch}\5.2\systree\lib\lua\5.2\?.dll"; Flags: uninsdeletevalue

Root: HKLM; Tasks: SysInstall53; Subkey: "{#SysEnvPath}"; ValueType: expandsz; ValueName: "LUA_PATH_5_3"; ValueData: "!\?.lua;!\?\init.lua;?.lua;?\init.lua;{app}\{#Arch}\5.3\systree\share\lua\5.3\?.lua;{app}\{#Arch}\5.3\systree\share\lua\5.3\?\init.lua"; Flags: uninsdeletevalue
Root: HKLM; Tasks: SysInstall53; Subkey: "{#SysEnvPath}"; ValueType: expandsz; ValueName: "LUA_CPATH_5_3"; ValueData: "!\?.dll;?.dll;{app}\{#Arch}\5.3\systree\lib\lua\5.3\?.dll"; Flags: uninsdeletevalue

[Registry]
; File association

; Register applicatins

Root: HKCR; Tasks: SysInstall51\assoc; Subkey: "LuaEnv51{#Arch}"; ValueType: none; Flags: dontcreatekey uninsdeletekey
Root: HKCR; Tasks: SysInstall51\assoc; Subkey: "LuaEnv51{#Arch}\Shell\Open\Command"; ValueType: expandsz; ValueName: ""; ValueData: "{app}\{#Arch}\5.1\bin\lua51.exe ""%1"" %*";

Root: HKCR; Tasks: SysInstall52\assoc; Subkey: "LuaEnv52{#Arch}"; ValueType: none; Flags: dontcreatekey uninsdeletekey
Root: HKCR; Tasks: SysInstall52\assoc; Subkey: "LuaEnv52{#Arch}\Shell\Open\Command"; ValueType: expandsz; ValueName: ""; ValueData: "{app}\{#Arch}\5.1\bin\lua51.exe ""%1"" %*";

Root: HKCR; Tasks: SysInstall53\assoc; Subkey: "LuaEnv53{#Arch}"; ValueType: none; Flags: dontcreatekey uninsdeletekey
Root: HKCR; Tasks: SysInstall53\assoc; Subkey: "LuaEnv53{#Arch}\Shell\Open\Command"; ValueType: expandsz; ValueName: ""; ValueData: "{app}\{#Arch}\5.1\bin\lua51.exe ""%1"" %*";

; Make associations

Root: HKCR; Tasks: SysInstall51\assoc\l51; Subkey: ".l51"; ValueType: none; Flags: dontcreatekey uninsdeletekey
Root: HKCR; Tasks: SysInstall51\assoc\l51; Subkey: ".l51"; ValueType: string; ValueName: ""; ValueData: "LuaEnv51{#Arch}";

Root: HKCR; Tasks: SysInstall52\assoc\l52; Subkey: ".l52"; ValueType: none; Flags: dontcreatekey uninsdeletekey
Root: HKCR; Tasks: SysInstall52\assoc\l52; Subkey: ".l52"; ValueType: string; ValueName: ""; ValueData: "LuaEnv52{#Arch}";

Root: HKCR; Tasks: SysInstall53\assoc\l53; Subkey: ".l53"; ValueType: none; Flags: dontcreatekey uninsdeletekey
Root: HKCR; Tasks: SysInstall53\assoc\l53; Subkey: ".l53"; ValueType: string; ValueName: ""; ValueData: "LuaEnv53{#Arch}";

Root: HKCR; Tasks: SysInstall51\assoc\lua; Subkey: ".lua"; ValueType: none; Flags: dontcreatekey uninsdeletekey
Root: HKCR; Tasks: SysInstall51\assoc\lua; Subkey: ".lua"; ValueType: string; ValueName: ""; ValueData: "LuaEnv51{#Arch}";

Root: HKCR; Tasks: SysInstall52\assoc\lua; Subkey: ".lua"; ValueType: none; Flags: dontcreatekey uninsdeletekey
Root: HKCR; Tasks: SysInstall52\assoc\lua; Subkey: ".lua"; ValueType: string; ValueName: ""; ValueData: "LuaEnv52{#Arch}";

Root: HKCR; Tasks: SysInstall52\assoc\lua; Subkey: ".lua"; ValueType: none; Flags: dontcreatekey uninsdeletekey
Root: HKCR; Tasks: SysInstall52\assoc\lua; Subkey: ".lua"; ValueType: string; ValueName: ""; ValueData: "LuaEnv53{#Arch}";

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
end;

[Code]
const
  EnvironmentKey = 'SYSTEM\CurrentControlSet\Control\Session Manager\Environment';

procedure WinMessageError(msg : string);
var
  err : cardinal;
begin
  err := DLLGetLastError();
  MsgBox(msg + ': ' + IntToStr(err) + #13 + SysErrorMessage(err), mbError, MB_OK);
end;

function RemoveSepSubstr(var str: string; const val, sep: string): boolean;
var
  P : integer;
begin
  Result := true;
  P := Pos(sep + Uppercase(val) + sep, sep + Uppercase(str) + sep);
  if P > 0 then Delete(str, P - 1, Length(val) + 1)
  else Result := false
end;

procedure EnvRemove(Name, Value: string);
var
  Values: string;
begin
  Value := ExpandConstant(Value);

  if not RegQueryStringValue(HKEY_LOCAL_MACHINE, '{#SysEnvPath}', Name, Values) then begin
    Log(Format('[REMOVE] %s not found', [Name]));
    exit;
  end;

  Log(Format('[REMOVE] %s is [%s]', [Name, Values]));

  if not RemoveSepSubstr(Values, Value, ';') then begin
    Log(Format('[REMOVE] value [%s] not found in %s', [Value, Name]));
    exit;
  end;

  Log(Format('[REMOVE] value [%s] removed from %s => [%s]', [Value, Name, Values]));

  if not RegWriteStringValue(HKEY_LOCAL_MACHINE, '{#SysEnvPath}', Name, Values) then begin
    Log(Format('Error writing %s: [%s]', [Name, SysErrorMessage(DLLGetLastError())]));
    exit;
  end;

  Log(Format('[REMOVE] %s written', [Name]));
end;

procedure EnvAppend(Name, Value: string);
var
  Values: string;
begin
  Value := ExpandConstant(Value);

  if not RegQueryStringValue(HKEY_LOCAL_MACHINE, '{#SysEnvPath}', Name, Values) then begin
    Log(Format('[APPEND] %s not found', [Name]));
    Values := '';
  end;

  Log(Format('[APPEND] %s is [%s]', [Name, Values]));

  if RemoveSepSubstr(Values, Value, ';') then begin
    Log(Format('[APPEND] value [%s] already found in %s', [Value, Name]));
    exit;
  end;

  Log(Format('[APPEND] value [%s] append to %s => [%s]', [Value, Name, Values]));

  Values := Values + ';' + Value;

  if not RegWriteStringValue(HKEY_LOCAL_MACHINE, '{#SysEnvPath}', Name, Values) then begin
    Log(Format('Error writing %s: [%s]', [Name, SysErrorMessage(DLLGetLastError())]));
    exit;
  end;

  Log(Format('[REMOVE] %s written', [Name]));
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssPostInstall then begin
    EnvAppend('PATH', '{app}');

    if IsTaskSelected('SysInstall51') 
      or IsTaskSelected('SysInstall52') 
      or IsTaskSelected('SysInstall53') 
    then begin
      EnvAppend('PATH', '{app}\{#Arch}\LuaRocks');
      EnvAppend('PATH', '{app}\{#Arch}\external\bin');
    end;

    if IsTaskSelected('SysInstall51') then begin
      EnvAppend('PATH', '{app}\{#Arch}\5.1\bin');
      EnvAppend('PATH', '{app}\{#Arch}\5.1\systree\bin');
    end;

    if IsTaskSelected('SysInstall52') then begin
      EnvAppend('PATH', '{app}\{#Arch}\5.2\bin');
      EnvAppend('PATH', '{app}\{#Arch}\5.2\systree\bin');
    end;

    if IsTaskSelected('SysInstall53') then begin
      EnvAppend('PATH', '{app}\{#Arch}\5.3\bin');
      EnvAppend('PATH', '{app}\{#Arch}\5.3\systree\bin');
    end;

    if IsTaskSelected('SysInstall51\assoc\lua')
      or IsTaskSelected('SysInstall52\assoc\lua')
      or IsTaskSelected('SysInstall53\assoc\lua')
    then EnvAppend('PATHEXT', '.LUA');

    if IsTaskSelected('SysInstall51\assoc\l51') then EnvAppend('PATHEXT', '.L51');
    if IsTaskSelected('SysInstall51\assoc\l52') then EnvAppend('PATHEXT', '.L52');
    if IsTaskSelected('SysInstall51\assoc\l53') then EnvAppend('PATHEXT', '.L53');

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
