; ==========================================================================
; External dep - libsodium
; ==========================================================================

[Components]
Name: "External\libsodium"; Description: "libsodium"
Name: "External\libsodium\dynamic"; Description: "Dynamic"; Flags: exclusive; Types: FullDynamic FullStatic

[Files]
Source: "{#ROOT}\libs\libsodium\lic\*"; DestDir: "{app}\{#Arch}\external\lic\libsodium"; Flags: recursesubdirs; Components: External\libsodium
Source: "{#ROOT}\libs\libsodium\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\libsodium

; External dep - libsodium dynamic
Source: "{#ROOT}\libs\libsodium\{#ArchName}\{#RT}\dynamic\libsodium.lib"; DestDir: "{app}\{#Arch}\external\lib"; Components: External\libsodium\dynamic
Source: "{#ROOT}\libs\libsodium\{#ArchName}\{#RT}\dynamic\libsodium.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\libsodium\dynamic
