; ==========================================================================
; External dep - libuv
; ==========================================================================

[Components]
Name: "External\libuv"; Description: "libuv"
Name: "External\libuv\dynamic"; Description: "Dynamic"; Flags: exclusive; Types: FullDynamic
Name: "External\libuv\static";  Description: "Static"; Flags: exclusive; Types: FullStatic

[Files]
Source: "{#ROOT}\libs\libuv\lic\*"; DestDir: "{app}\{#Arch}\external\lic\libuv"; Flags: recursesubdirs; Components: External\libuv
Source: "{#ROOT}\libs\libuv\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\libuv

; External dep - libuv dynamic
Source: "{#ROOT}\libs\libuv\{#ArchName}\{#RT}\dynamic\libuv.lib"; DestDir: "{app}\{#Arch}\external\lib"; DestName: libuv.lib; Components: External\libuv\dynamic
Source: "{#ROOT}\libs\libuv\{#ArchName}\{#RT}\dynamic\*.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\libuv\dynamic
Source: "{#ROOT}\libs\libuv\{#ArchName}\{#RT}\dynamic\*.exe"; DestDir: "{app}\{#Arch}\external\bin"; Flags: skipifsourcedoesntexist; Components: External\libuv\dynamic

; External dep - libuv static
Source: "{#ROOT}\libs\libuv\{#ArchName}\{#RT}\static\libuv.lib"; DestDir: "{app}\{#Arch}\external\lib"; DestName: libuv.lib; Components: External\libuv\static
Source: "{#ROOT}\libs\libuv\{#ArchName}\{#RT}\static\*.exe"; DestDir: "{app}\{#Arch}\external\bin"; Flags: skipifsourcedoesntexist; Components: External\libuv\static
