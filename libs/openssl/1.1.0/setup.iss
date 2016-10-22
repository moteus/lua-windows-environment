; ==========================================================================
; External dep - OpenSSL 1.1
; ==========================================================================

[Components]
; OpenSSL
Name: "External\OpenSSL\v1_1"; Description: "1.1.x"; Flags: exclusive
Name: "External\OpenSSL\v1_1\dynamic"; Description: "Dynamic"; Flags: exclusive

[Files]
; External dep - OpenSSL 1.1
Source: "{#ROOT}\libs\openssl\1.1.0\lic\*"; DestDir: "{app}\{#Arch}\external\lic\openssl"; Flags: recursesubdirs; Components: External\OpenSSL\v1_1
Source: "{#ROOT}\libs\openssl\1.1.0\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\OpenSSL\v1_1
Source: "{#ROOT}\libs\openssl\1.1.0\{#ArchName}\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\OpenSSL\v1_1

; External dep - OpenSSL 1.1 dynamic
Source: "{#ROOT}\libs\openssl\1.1.0\{#ArchName}\{#RT}\dynamic\*.lib"; DestDir: "{app}\{#Arch}\external\lib"; Flags: recursesubdirs; Components: External\OpenSSL\v1_1\dynamic
Source: "{#ROOT}\libs\openssl\1.1.0\{#ArchName}\{#RT}\dynamic\*.dll"; DestDir: "{app}\{#Arch}\external\bin"; Flags: recursesubdirs; Components: External\OpenSSL\v1_1\dynamic
Source: "{#ROOT}\libs\openssl\1.1.0\{#ArchName}\{#RT}\dynamic\*.exe"; DestDir: "{app}\{#Arch}\external\bin"; Flags: recursesubdirs; Components: External\OpenSSL\v1_1\dynamic
