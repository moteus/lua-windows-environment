; ==========================================================================
; External dep - OpenSSL 1.1
; ==========================================================================

[Components]
; OpenSSL
Name: "External\OpenSSL\v1_1_0e"; Description: "1.1.0e"; Flags: exclusive
Name: "External\OpenSSL\v1_1_0e\dynamic"; Description: "Dynamic"; Flags: exclusive

[Files]
; External dep - OpenSSL 1.1
Source: "{#ROOT}\libs\openssl\1.1.0e\lic\*"; DestDir: "{app}\{#Arch}\external\lic\openssl"; Flags: recursesubdirs; Components: External\OpenSSL\v1_1_0e

; External dep - OpenSSL 1.1 dynamic
Source: "{#ROOT}\libs\openssl\1.1.0e\{#ArchName}\{#RT}\dynamic\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\OpenSSL\v1_1_0e\dynamic
Source: "{#ROOT}\libs\openssl\1.1.0e\{#ArchName}\{#RT}\dynamic\lib\*"; DestDir: "{app}\{#Arch}\external\lib"; Flags: recursesubdirs; Components: External\OpenSSL\v1_1_0e\dynamic
Source: "{#ROOT}\libs\openssl\1.1.0e\{#ArchName}\{#RT}\dynamic\bin\*"; DestDir: "{app}\{#Arch}\external\bin"; Flags: recursesubdirs; Components: External\OpenSSL\v1_1_0e\dynamic

