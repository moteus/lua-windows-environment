; ==========================================================================
; External dep - libuv 1.12.0
; ==========================================================================

[Components]
Name: "External\libuv\v_1_12_0"; Description: "1.12.0"; Flags: exclusive
Name: "External\libuv\v_1_12_0\dynamic"; Description: "Dynamic"; Flags: exclusive
Name: "External\libuv\v_1_12_0\static";  Description: "Static"; Flags: exclusive

[Files]
Source: "{#ROOT}\libs\libuv\1.12.0\lic\*"; DestDir: "{app}\{#Arch}\external\lic\libuv"; Flags: recursesubdirs; Components: External\libuv\v_1_12_0
Source: "{#ROOT}\libs\libuv\1.12.0\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\libuv\v_1_12_0

; External dep - libuv dynamic
Source: "{#ROOT}\libs\libuv\1.12.0\{#ArchName}\{#RT}\dynamic\libuv.lib"; DestDir: "{app}\{#Arch}\external\lib"; DestName: libuv.lib; Components: External\libuv\v_1_12_0\dynamic
Source: "{#ROOT}\libs\libuv\1.12.0\{#ArchName}\{#RT}\dynamic\libuv.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\libuv\v_1_12_0\dynamic

; External dep - libuv static
Source: "{#ROOT}\libs\libuv\1.12.0\{#ArchName}\{#RT}\static\libuv.lib"; DestDir: "{app}\{#Arch}\external\lib"; DestName: libuv.lib; Components: External\libuv\v_1_12_0\static
