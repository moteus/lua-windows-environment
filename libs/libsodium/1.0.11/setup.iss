; ==========================================================================
; External dep - libsodium
; ==========================================================================

[Components]
Name: "External\libsodium\v_1_0_11"; Description: "libsodium"
Name: "External\libsodium\v_1_0_11\dynamic"; Description: "Dynamic"; Flags: exclusive; Types: FullDynamic FullStatic

[Files]
Source: "{#ROOT}\libs\libsodium\1.0.11\lic\*"; DestDir: "{app}\{#Arch}\external\lic\libsodium"; Flags: recursesubdirs; Components: External\libsodium\v_1_0_11
Source: "{#ROOT}\libs\libsodium\1.0.11\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\libsodium\v_1_0_11

; External dep - libsodium dynamic
Source: "{#ROOT}\libs\libsodium\1.0.11\{#ArchName}\{#RT}\dynamic\libsodium.lib"; DestDir: "{app}\{#Arch}\external\lib"; Components: External\libsodium\v_1_0_11\dynamic
Source: "{#ROOT}\libs\libsodium\1.0.11\{#ArchName}\{#RT}\dynamic\libsodium.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\libsodium\v_1_0_11\dynamic
