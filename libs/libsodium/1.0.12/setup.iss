; ==========================================================================
; External dep - libsodium 1.0.12
; ==========================================================================

[Components]
Name: "External\libsodium\v_1_0_12"; Description: "1.0.12"; Flags: exclusive
Name: "External\libsodium\v_1_0_12\dynamic"; Description: "Dynamic"; Flags: exclusive

[Files]
Source: "{#ROOT}\libs\libsodium\1.0.12\lic\*"; DestDir: "{app}\{#Arch}\external\lic\libsodium"; Flags: recursesubdirs; Components: External\libsodium\v_1_0_12
Source: "{#ROOT}\libs\libsodium\1.0.12\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\libsodium\v_1_0_12

; External dep - libsodium dynamic
Source: "{#ROOT}\libs\libsodium\1.0.12\{#ArchName}\{#RT}\dynamic\libsodium.lib"; DestDir: "{app}\{#Arch}\external\lib"; Components: External\libsodium\v_1_0_12\dynamic
Source: "{#ROOT}\libs\libsodium\1.0.12\{#ArchName}\{#RT}\dynamic\libsodium.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\libsodium\v_1_0_12\dynamic
