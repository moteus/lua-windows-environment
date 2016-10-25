; ==========================================================================
; External dep - libuv 1.10.0
; ==========================================================================

[Components]
Name: "External\libuv\v_1_10_0"; Description: "1.10.0"; Flags: exclusive
Name: "External\libuv\v_1_10_0\dynamic"; Description: "Dynamic"; Flags: exclusive; Types: FullDynamic
Name: "External\libuv\v_1_10_0\static";  Description: "Static"; Flags: exclusive; Types: FullStatic

[Files]
Source: "{#ROOT}\libs\libuv\1.10.0\lic\*"; DestDir: "{app}\{#Arch}\external\lic\libuv"; Flags: recursesubdirs; Components: External\libuv\v_1_10_0
Source: "{#ROOT}\libs\libuv\1.10.0\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\libuv\v_1_10_0

; External dep - libuv dynamic
Source: "{#ROOT}\libs\libuv\1.10.0\{#ArchName}\{#RT}\dynamic\libuv.lib"; DestDir: "{app}\{#Arch}\external\lib"; DestName: libuv.lib; Components: External\libuv\v_1_10_0\dynamic
Source: "{#ROOT}\libs\libuv\1.10.0\{#ArchName}\{#RT}\dynamic\libuv.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\libuv\v_1_10_0\dynamic

; External dep - libuv static
Source: "{#ROOT}\libs\libuv\1.10.0\{#ArchName}\{#RT}\static\libuv.lib"; DestDir: "{app}\{#Arch}\external\lib"; DestName: libuv.lib; Components: External\libuv\v_1_10_0\static
