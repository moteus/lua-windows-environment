; ==========================================================================
; External dep - nanomsg 1.0.0
; ==========================================================================

[Components]
Name: "External\nanomsg\v_1_0_0"; Description: "1.0.0"; Flags: exclusive
Name: "External\nanomsg\v_1_0_0\dynamic"; Description: "Dynamic"; Flags: exclusive; Types: FullDynamic FullStatic

[Files]
Source: "{#ROOT}\libs\nanomsg\1.0.0\lic\*"; DestDir: "{app}\{#Arch}\external\lic\nanomsg"; Flags: recursesubdirs; Components: External\nanomsg\v_1_0_0
Source: "{#ROOT}\libs\nanomsg\1.0.0\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\nanomsg\v_1_0_0

; External dep - nanomsg dynamic
Source: "{#ROOT}\libs\nanomsg\1.0.0\{#ArchName}\{#RT}\dynamic\nanomsg.lib"; DestDir: "{app}\{#Arch}\external\lib"; Components: External\nanomsg\v_1_0_0\dynamic
Source: "{#ROOT}\libs\nanomsg\1.0.0\{#ArchName}\{#RT}\dynamic\nanomsg.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\nanomsg\v_1_0_0\dynamic

