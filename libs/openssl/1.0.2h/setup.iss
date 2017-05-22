; ==========================================================================
; External dep - OpenSSL 1.0
; ==========================================================================

[Components]
; OpenSSL
Name: "External\OpenSSL\v1_0_2h"; Description: "1.0.2h"; Flags: exclusive
Name: "External\OpenSSL\v1_0_2h\dynamic"; Description: "Dynamic"; Flags: exclusive; Types: FullDynamic
Name: "External\OpenSSL\v1_0_2h\static"; Description: "Static"; Flags: exclusive; Types: FullStatic

[Files]
; External dep - OpenSSL 1.0 dynamic
Source: "{#ROOT}\libs\openssl\1.0.2h\{#ArchName}\{#RT}\dynamic\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\OpenSSL\v1_0_2h\dynamic
Source: "{#ROOT}\libs\openssl\1.0.2h\{#ArchName}\{#RT}\dynamic\lib\*"; DestDir: "{app}\{#Arch}\external\lib"; Flags: recursesubdirs; Components: External\OpenSSL\v1_0_2h\dynamic
Source: "{#ROOT}\libs\openssl\1.0.2h\{#ArchName}\{#RT}\dynamic\bin\*"; DestDir: "{app}\{#Arch}\external\bin"; Flags: recursesubdirs; Components: External\OpenSSL\v1_0_2h\dynamic

; External dep - OpenSSL 1.0 static
Source: "{#ROOT}\libs\openssl\1.0.2h\{#ArchName}\{#RT}\static\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\OpenSSL\v1_0_2h\static
Source: "{#ROOT}\libs\openssl\1.0.2h\{#ArchName}\{#RT}\static\lib\*"; DestDir: "{app}\{#Arch}\external\lib"; Flags: recursesubdirs; Components: External\OpenSSL\v1_0_2h\static
Source: "{#ROOT}\libs\openssl\1.0.2h\{#ArchName}\{#RT}\static\bin\*"; DestDir: "{app}\{#Arch}\external\bin"; Flags: recursesubdirs; Components: External\OpenSSL\v1_0_2h\static
