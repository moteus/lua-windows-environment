; ==========================================================================
; External dep - OpenSSL 1.0
; ==========================================================================

[Components]
; OpenSSL
Name: "External\OpenSSL\v1_0"; Description: "1.0.x"; Flags: exclusive
Name: "External\OpenSSL\v1_0\dynamic"; Description: "Dynamic"; Flags: exclusive
Name: "External\OpenSSL\v1_0\static"; Description: "Static"; Flags: exclusive

[Files]
; External dep - OpenSSL 1.0 dynamic
Source: "{#ROOT}\libs\openssl\1.0.2h\{#ArchName}\{#RT}\dynamic\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\OpenSSL\v1_0\dynamic
Source: "{#ROOT}\libs\openssl\1.0.2h\{#ArchName}\{#RT}\dynamic\lib\*"; DestDir: "{app}\{#Arch}\external\lib"; Flags: recursesubdirs; Components: External\OpenSSL\v1_0\dynamic
Source: "{#ROOT}\libs\openssl\1.0.2h\{#ArchName}\{#RT}\dynamic\bin\*"; DestDir: "{app}\{#Arch}\external\bin"; Flags: recursesubdirs; Components: External\OpenSSL\v1_0\dynamic

; External dep - OpenSSL 1.0 static
Source: "{#ROOT}\libs\openssl\1.0.2h\{#ArchName}\{#RT}\static\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\OpenSSL\v1_0\static
Source: "{#ROOT}\libs\openssl\1.0.2h\{#ArchName}\{#RT}\static\lib\*"; DestDir: "{app}\{#Arch}\external\lib"; Flags: recursesubdirs; Components: External\OpenSSL\v1_0\static
Source: "{#ROOT}\libs\openssl\1.0.2h\{#ArchName}\{#RT}\static\bin\*"; DestDir: "{app}\{#Arch}\external\bin"; Flags: recursesubdirs; Components: External\OpenSSL\v1_0\static
