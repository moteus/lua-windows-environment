; ==========================================================================
; External dep - SQLite
; ==========================================================================

[Components]
Name: "External\SQLite"; Description: "SQLite"
Name: "External\SQLite\dynamic"; Description: "Dynamic"; Flags: exclusive
Name: "External\SQLite\static";  Description: "Static"; Flags: exclusive

[Files]
Source: "{#ROOT}\libs\SQLite\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\SQLite

; External dep - SQLite dynamic
Source: "{#ROOT}\libs\SQLite\{#ArchName}\{#RT}\dynamic\*.lib"; DestDir: "{app}\{#Arch}\external\lib"; Components: External\SQLite\dynamic
Source: "{#ROOT}\libs\SQLite\{#ArchName}\{#RT}\dynamic\*.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\SQLite\dynamic
Source: "{#ROOT}\libs\SQLite\{#ArchName}\{#RT}\dynamic\*.exe"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\SQLite\dynamic; Flags: skipifsourcedoesntexist

; External dep - SQLite static
Source: "{#ROOT}\libs\SQLite\{#ArchName}\{#RT}\static\*.lib"; DestDir: "{app}\{#Arch}\external\lib"; Components: External\SQLite\static
Source: "{#ROOT}\libs\SQLite\{#ArchName}\{#RT}\static\*.exe"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\SQLite\static; Flags: skipifsourcedoesntexist
