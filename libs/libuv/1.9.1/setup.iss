; ==========================================================================
; External dep - libuv 1.9.1
; ==========================================================================

[Components]
Name: "External\libuv\v1_9_1"; Description: "1.9.1"; Flags: exclusive
Name: "External\libuv\v1_9_1\dynamic"; Description: "Dynamic"; Flags: exclusive
Name: "External\libuv\v1_9_1\static";  Description: "Static"; Flags: exclusive

[Files]
Source: "{#ROOT}\libs\libuv\1.9.1\lic\*"; DestDir: "{app}\{#Arch}\external\lic\libuv"; Flags: recursesubdirs; Components: External\libuv\v1_9_1
Source: "{#ROOT}\libs\libuv\1.9.1\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\libuv\v1_9_1

; External dep - libuv dynamic
Source: "{#ROOT}\libs\libuv\1.9.1\{#ArchName}\{#RT}\dynamic\libuv.lib"; DestDir: "{app}\{#Arch}\external\lib"; DestName: libuv.lib; Components: External\libuv\v1_9_1\dynamic
Source: "{#ROOT}\libs\libuv\1.9.1\{#ArchName}\{#RT}\dynamic\libuv.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\libuv\v1_9_1\dynamic

; External dep - libuv static
Source: "{#ROOT}\libs\libuv\1.9.1\{#ArchName}\{#RT}\static\libuv.lib"; DestDir: "{app}\{#Arch}\external\lib"; DestName: libuv.lib; Components: External\libuv\v1_9_1\static
