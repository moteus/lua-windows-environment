; ==========================================================================
; External dep - OpenSSL 1.0
; ==========================================================================

[Components]
; OpenSSL
Name: "External\OpenSSL\v1_0_2l"; Description: "1.0.2l"; Flags: exclusive
Name: "External\OpenSSL\v1_0_2l\dynamic"; Description: "Dynamic"; Flags: exclusive; Types: FullDynamic
Name: "External\OpenSSL\v1_0_2l\static"; Description: "Static"; Flags: exclusive; Types: FullStatic

[Files]
; External dep - OpenSSL License
Source: "{#ROOT}\libs\openssl\1.0.2l\lic\*"; DestDir: "{app}\{#Arch}\external\lic\openssl"; Flags: recursesubdirs; Components: External\OpenSSL\v1_0_2l

; External dep - OpenSSL 1.0 dynamic
Source: "{#ROOT}\libs\openssl\1.0.2l\{#ArchName}\{#RT}\dynamic\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\OpenSSL\v1_0_2l\dynamic
Source: "{#ROOT}\libs\openssl\1.0.2l\{#ArchName}\{#RT}\dynamic\lib\*"; DestDir: "{app}\{#Arch}\external\lib"; Flags: recursesubdirs; Components: External\OpenSSL\v1_0_2l\dynamic
Source: "{#ROOT}\libs\openssl\1.0.2l\{#ArchName}\{#RT}\dynamic\bin\*"; DestDir: "{app}\{#Arch}\external\bin"; Flags: recursesubdirs; Components: External\OpenSSL\v1_0_2l\dynamic

; External dep - OpenSSL 1.0 static
Source: "{#ROOT}\libs\openssl\1.0.2l\{#ArchName}\{#RT}\static\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\OpenSSL\v1_0_2l\static
Source: "{#ROOT}\libs\openssl\1.0.2l\{#ArchName}\{#RT}\static\lib\*"; DestDir: "{app}\{#Arch}\external\lib"; Flags: recursesubdirs; Components: External\OpenSSL\v1_0_2l\static
Source: "{#ROOT}\libs\openssl\1.0.2l\{#ArchName}\{#RT}\static\bin\*"; DestDir: "{app}\{#Arch}\external\bin"; Flags: recursesubdirs; Components: External\OpenSSL\v1_0_2l\static
