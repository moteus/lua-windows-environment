; ==========================================================================
; External dep - zziplib 0.13.66
; ==========================================================================

[Components]
Name: "External\zzip\v_0_13_66"; Description: "0.13.66"; Flags: exclusive
Name: "External\zzip\v_0_13_66\static";  Description: "Static";  Flags: exclusive; Types: FullStatic FullDynamic

[Files]
Source: "{#ROOT}\libs\zzip\0.13.66\lic\*"; DestDir: "{app}\{#Arch}\external\lic\zzip"; Flags: recursesubdirs; Components: External\zzip\v_0_13_66
Source: "{#ROOT}\libs\zzip\0.13.66\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\zzip\v_0_13_66

; External dep - zziplib static
Source: "{#ROOT}\libs\zzip\0.13.66\{#ArchName}\{#RT}\static\zziplib.lib"; DestName: zziplib.lib; DestDir: "{app}\{#Arch}\external\lib"; Components: External\zzip\v_0_13_66\static
Source: "{#ROOT}\libs\zzip\0.13.66\{#ArchName}\{#RT}\static\zziplib.lib"; DestName: zzip.lib; DestDir: "{app}\{#Arch}\external\lib"; Components: External\zzip\v_0_13_66\static
