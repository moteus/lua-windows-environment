; ==========================================================================
; External dep - libyaml 0.1.7
; ==========================================================================

[Components]
Name: "External\libyaml"; Description: "YAML"
Name: "External\libyaml\dynamic"; Description: "Dynamic"; Flags: exclusive; Types: FullDynamic
Name: "External\libyaml\static";  Description: "Static"; Flags: exclusive; Types: FullStatic

[Files]
Source: "{#ROOT}\libs\libyaml\0.1.7\lic\*"; DestDir: "{app}\{#Arch}\external\lic\libyaml"; Flags: recursesubdirs; Components: External\libyaml
Source: "{#ROOT}\libs\libyaml\0.1.7\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\libyaml

; External dep - libyaml dynamic
Source: "{#ROOT}\libs\libyaml\0.1.7\{#ArchName}\{#RT}\dynamic\libyaml.lib"; DestDir: "{app}\{#Arch}\external\lib"; Components: External\libyaml\dynamic
Source: "{#ROOT}\libs\libyaml\0.1.7\{#ArchName}\{#RT}\dynamic\libyaml.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\libyaml\dynamic

; External dep - libyaml static
Source: "{#ROOT}\libs\libyaml\0.1.7\{#ArchName}\{#RT}\static\libyaml.lib"; DestDir: "{app}\{#Arch}\external\lib"; Components: External\libyaml\static
