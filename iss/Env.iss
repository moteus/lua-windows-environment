#ifndef SysEnvPath
#define SysEnvPath "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"
#endif

[code]

function EnvRemoveSepSubstr(var str: string; const val, sep: string): boolean;
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

  if not EnvRemoveSepSubstr(Values, Value, ';') then begin
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

  if EnvRemoveSepSubstr(Values, Value, ';') then begin
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
