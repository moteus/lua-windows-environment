; ==========================================================================
; External dep - cURL 7.54.0
; ==========================================================================

[Components]
Name: "External\curl\v7_54_0"; Description: "7.54.0"; Flags: exclusive
Name: "External\curl\v7_54_0\sspi"; Description: "DLL WinSSPI"; Flags: exclusive; Types: FullDynamic FullStatic
Name: "External\curl\v7_54_0\ossl_1_0"; Description: "DLL OpenSSL (1.0.x) "; Flags: exclusive;
Name: "External\curl\v7_54_0\ossl_1_1"; Description: "DLL OpenSSL (1.1.x) "; Flags: exclusive;

[Files]
Source: "{#ROOT}\libs\curl\7.54.0\lic\*"; DestDir: "{app}\{#Arch}\external\lic\curl"; Flags: recursesubdirs; Components: External\curl\v7_54_0
Source: "{#ROOT}\libs\curl\7.54.0\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\curl\v7_54_0

; External dep - curl OpenSSL(1.0)
Source: "{#ROOT}\libs\curl\7.54.0\{#ArchName}\{#RT}\DLL Release - DLL OpenSSL\1.0.2h\curl.exe"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\curl\v7_54_0\ossl_1_0
Source: "{#ROOT}\libs\curl\7.54.0\{#ArchName}\{#RT}\DLL Release - DLL OpenSSL\1.0.2h\libcurl.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\curl\v7_54_0\ossl_1_0
Source: "{#ROOT}\libs\curl\7.54.0\{#ArchName}\{#RT}\DLL Release - DLL OpenSSL\1.0.2h\libcurl.lib"; DestDir: "{app}\{#Arch}\external\lib"; Components: External\curl\v7_54_0\ossl_1_0

; External dep - curl OpenSSL(1.1)
Source: "{#ROOT}\libs\curl\7.54.0\{#ArchName}\{#RT}\DLL Release - DLL OpenSSL\1.1.0e\curl.exe"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\curl\v7_54_0\ossl_1_1
Source: "{#ROOT}\libs\curl\7.54.0\{#ArchName}\{#RT}\DLL Release - DLL OpenSSL\1.1.0e\libcurl.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\curl\v7_54_0\ossl_1_1
Source: "{#ROOT}\libs\curl\7.54.0\{#ArchName}\{#RT}\DLL Release - DLL OpenSSL\1.1.0e\libcurl.lib"; DestDir: "{app}\{#Arch}\external\lib"; Components: External\curl\v7_54_0\ossl_1_1

; External dep - curl WinSSPI
Source: "{#ROOT}\libs\curl\7.54.0\{#ArchName}\{#RT}\DLL Release - DLL Windows SSPI\curl.exe"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\curl\v7_54_0\sspi
Source: "{#ROOT}\libs\curl\7.54.0\{#ArchName}\{#RT}\DLL Release - DLL Windows SSPI\libcurl.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\curl\v7_54_0\sspi
Source: "{#ROOT}\libs\curl\7.54.0\{#ArchName}\{#RT}\DLL Release - DLL Windows SSPI\libcurl.lib"; DestDir: "{app}\{#Arch}\external\lib"; Components: External\curl\v7_54_0\sspi
