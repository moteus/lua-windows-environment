; ==========================================================================
; External dep - pcre
; ==========================================================================

[Components]
Name: "External\pcre"; Description: "PCRE"
Name: "External\pcre\dynamic"; Description: "Dynamic"; Flags: exclusive; Types: FullDynamic
Name: "External\pcre\static";  Description: "Static"; Flags: exclusive; Types: FullStatic

[Files]
Source: "{#ROOT}\libs\pcre\lic\*"; DestDir: "{app}\{#Arch}\external\lic\pcre"; Flags: recursesubdirs; Components: External\pcre
Source: "{#ROOT}\libs\pcre\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\pcre

; External dep - pcre dynamic
Source: "{#ROOT}\libs\pcre\{#ArchName}\{#RT}\dynamic\*.lib"; DestDir: "{app}\{#Arch}\external\lib"; Components: External\pcre\dynamic
Source: "{#ROOT}\libs\pcre\{#ArchName}\{#RT}\dynamic\*.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\pcre\dynamic

; External dep - pcre static
Source: "{#ROOT}\libs\pcre\{#ArchName}\{#RT}\static\*.lib"; DestDir: "{app}\{#Arch}\external\lib"; Components: External\pcre\static
