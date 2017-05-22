; ==========================================================================
; External dep - OpenSSL 1.0
; ==========================================================================

[Components]
; OpenSSL
Name: "External\OpenSSL\v1_0_2k"; Description: "1.0.2k"; Flags: exclusive
Name: "External\OpenSSL\v1_0_2k\dynamic"; Description: "Dynamic"; Flags: exclusive; Types: FullDynamic
Name: "External\OpenSSL\v1_0_2k\static"; Description: "Static"; Flags: exclusive; Types: FullStatic

[Files]
; External dep - OpenSSL 1.0 dynamic
Source: "{#ROOT}\libs\openssl\1.0.2k\{#ArchName}\{#RT}\dynamic\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\OpenSSL\v1_0_2k\dynamic
Source: "{#ROOT}\libs\openssl\1.0.2k\{#ArchName}\{#RT}\dynamic\lib\*"; DestDir: "{app}\{#Arch}\external\lib"; Flags: recursesubdirs; Components: External\OpenSSL\v1_0_2k\dynamic
Source: "{#ROOT}\libs\openssl\1.0.2k\{#ArchName}\{#RT}\dynamic\bin\*"; DestDir: "{app}\{#Arch}\external\bin"; Flags: recursesubdirs; Components: External\OpenSSL\v1_0_2k\dynamic

; External dep - OpenSSL 1.0 static
Source: "{#ROOT}\libs\openssl\1.0.2k\{#ArchName}\{#RT}\static\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\OpenSSL\v1_0_2k\static
Source: "{#ROOT}\libs\openssl\1.0.2k\{#ArchName}\{#RT}\static\lib\*"; DestDir: "{app}\{#Arch}\external\lib"; Flags: recursesubdirs; Components: External\OpenSSL\v1_0_2k\static
Source: "{#ROOT}\libs\openssl\1.0.2k\{#ArchName}\{#RT}\static\bin\*"; DestDir: "{app}\{#Arch}\external\bin"; Flags: recursesubdirs; Components: External\OpenSSL\v1_0_2k\static
