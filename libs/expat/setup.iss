; ==========================================================================
; External dep - expat
; ==========================================================================

[Components]
Name: "External\expat"; Description: "Expat"
Name: "External\expat\dynamic"; Description: "Dynamic"; Flags: exclusive; Types: FullDynamic
Name: "External\expat\static";  Description: "Static"; Flags: exclusive; Types: FullStatic

[Files]
Source: "{#ROOT}\libs\expat\lic\*"; DestDir: "{app}\{#Arch}\external\lic\Expat"; Flags: recursesubdirs; Components: External\expat
Source: "{#ROOT}\libs\expat\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\expat

; External dep - expat dynamic
Source: "{#ROOT}\libs\expat\{#ArchName}\{#RT}\dynamic\libexpat.lib"; DestDir: "{app}\{#Arch}\external\lib"; DestName: expat.lib; Components: External\expat\dynamic
Source: "{#ROOT}\libs\expat\{#ArchName}\{#RT}\dynamic\*.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\expat\dynamic
Source: "{#ROOT}\libs\expat\{#ArchName}\{#RT}\dynamic\*.exe"; DestDir: "{app}\{#Arch}\external\bin"; Flags: skipifsourcedoesntexist; Components: External\expat\dynamic

; External dep - expat static
Source: "{#ROOT}\libs\expat\{#ArchName}\{#RT}\static\libexpat.lib"; DestDir: "{app}\{#Arch}\external\lib"; DestName: expat.lib; Components: External\expat\static
Source: "{#ROOT}\libs\expat\{#ArchName}\{#RT}\static\*.exe"; DestDir: "{app}\{#Arch}\external\bin"; Flags: skipifsourcedoesntexist; Components: External\expat\static
