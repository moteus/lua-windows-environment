; ==========================================================================
; External dep - iconv
; ==========================================================================

[Components]
Name: "External\iconv"; Description: "iconv"
Name: "External\iconv\dynamic"; Description: "Dynamic"; Flags: exclusive; Types: FullDynamic
Name: "External\iconv\static";  Description: "Static"; Flags: exclusive; Types: FullStatic

[Files]
Source: "{#ROOT}\libs\iconv\lic\*"; DestDir: "{app}\{#Arch}\external\lic\iconv"; Flags: recursesubdirs; Components: External\iconv
Source: "{#ROOT}\libs\iconv\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\iconv

; External dep - iconv dynamic
Source: "{#ROOT}\libs\iconv\{#ArchName}\{#RT}\dynamic\libiconv.lib"; DestDir: "{app}\{#Arch}\external\lib"; DestName: iconv.lib; Components: External\iconv\dynamic
Source: "{#ROOT}\libs\iconv\{#ArchName}\{#RT}\dynamic\*.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\iconv\dynamic

; External dep - iconv static
Source: "{#ROOT}\libs\iconv\{#ArchName}\{#RT}\static\libiconv.lib"; DestDir: "{app}\{#Arch}\external\lib"; DestName: iconv.lib; Components: External\iconv\static
