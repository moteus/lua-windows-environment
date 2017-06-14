; ==========================================================================
; External dep - libzip 1.2.0
; ==========================================================================

[Components]
Name: "External\libzip\v_1_2_0"; Description: "1.2.0"; Flags: exclusive
Name: "External\libzip\v_1_2_0\dynamic"; Description: "Dynamic"; Flags: exclusive; Types: FullDynamic
Name: "External\libzip\v_1_2_0\static";  Description: "Static";  Flags: exclusive; Types: FullStatic

[Files]
Source: "{#ROOT}\libs\zip\1.2.0\lic\*"; DestDir: "{app}\{#Arch}\external\lic\zip"; Flags: recursesubdirs; Components: External\libzip\v_1_2_0
Source: "{#ROOT}\libs\zip\1.2.0\{#ArchName}\{#RT}\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\libzip\v_1_2_0

; External dep - libzip dynamic
Source: "{#ROOT}\libs\zip\1.2.0\{#ArchName}\{#RT}\dynamic\libzip.lib"; DestDir: "{app}\{#Arch}\external\lib"; DestName: zip.lib; Components: External\libzip\v_1_2_0\dynamic
Source: "{#ROOT}\libs\zip\1.2.0\{#ArchName}\{#RT}\dynamic\libzip.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\libzip\v_1_2_0\dynamic

; External dep - libzip dynamic
Source: "{#ROOT}\libs\zip\1.2.0\{#ArchName}\{#RT}\static\zip.lib"; DestDir: "{app}\{#Arch}\external\lib"; Components: External\libzip\v_1_2_0\static

