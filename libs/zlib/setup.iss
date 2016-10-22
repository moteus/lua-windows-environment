; ==========================================================================
; External dep - zlib
; ==========================================================================

[Components]
Name: "External\zlib"; Description: "zlib"
Name: "External\zlib\dynamic"; Description: "Dynamic"; Flags: exclusive
Name: "External\zlib\static";  Description: "Static"; Flags: exclusive

[Files]
Source: "{#ROOT}\libs\zlib\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\zlib

; External dep - zlib dynamic
Source: "{#ROOT}\libs\zlib\{#ArchName}\{#RT}\dynamic\zdll.lib"; DestDir: "{app}\{#Arch}\external\lib"; DestName: z.lib; Components: External\zlib\dynamic
Source: "{#ROOT}\libs\zlib\{#ArchName}\{#RT}\dynamic\zlib1.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\zlib\dynamic

; External dep - zlib static
Source: "{#ROOT}\libs\zlib\{#ArchName}\{#RT}\static\zlib.lib"; DestDir: "{app}\{#Arch}\external\lib"; DestName: z.lib; Components: External\zlib\static

