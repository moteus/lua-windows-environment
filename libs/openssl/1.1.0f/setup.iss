; ==========================================================================
; External dep - OpenSSL 1.1
; ==========================================================================

[Components]
; OpenSSL
Name: "External\OpenSSL\v1_1_0f"; Description: "1.1.0f"; Flags: exclusive
Name: "External\OpenSSL\v1_1_0f\dynamic"; Description: "Dynamic"; Flags: exclusive

[Files]
; External dep - OpenSSL 1.1
Source: "{#ROOT}\libs\openssl\1.1.0f\lic\*"; DestDir: "{app}\{#Arch}\external\lic\openssl"; Flags: recursesubdirs; Components: External\OpenSSL\v1_1_0f

; External dep - OpenSSL 1.1 dynamic
Source: "{#ROOT}\libs\openssl\1.1.0f\{#ArchName}\{#RT}\dynamic\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\OpenSSL\v1_1_0f\dynamic
Source: "{#ROOT}\libs\openssl\1.1.0f\{#ArchName}\{#RT}\dynamic\lib\*"; DestDir: "{app}\{#Arch}\external\lib"; Flags: recursesubdirs; Components: External\OpenSSL\v1_1_0f\dynamic
Source: "{#ROOT}\libs\openssl\1.1.0f\{#ArchName}\{#RT}\dynamic\bin\*"; DestDir: "{app}\{#Arch}\external\bin"; Flags: recursesubdirs; Components: External\OpenSSL\v1_1_0f\dynamic

