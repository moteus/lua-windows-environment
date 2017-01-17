; ==========================================================================
; External dep - cURL 7.50.1
; ==========================================================================

[Components]
Name: "External\curl\v7_50_1"; Description: "7.50.1"; Flags: exclusive
Name: "External\curl\v7_50_1\sspi"; Description: "DLL WinSSPI"; Flags: exclusive; Types: FullDynamic FullStatic
Name: "External\curl\v7_50_1\ossl"; Description: "DLL OpenSSL"; Flags: exclusive;

[Files]
Source: "{#ROOT}\libs\curl\7.50.1\lic\*"; DestDir: "{app}\{#Arch}\external\lic\curl"; Flags: recursesubdirs; Components: External\curl\v7_50_1
Source: "{#ROOT}\libs\curl\7.50.1\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\curl\v7_50_1

; External dep - curl OpenSSL
Source: "{#ROOT}\libs\curl\7.50.1\{#ArchName}\{#RT}\DLL Release - DLL OpenSSL\curl.exe"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\curl\v7_50_1\ossl
Source: "{#ROOT}\libs\curl\7.50.1\{#ArchName}\{#RT}\DLL Release - DLL OpenSSL\libcurl.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\curl\v7_50_1\ossl
Source: "{#ROOT}\libs\curl\7.50.1\{#ArchName}\{#RT}\DLL Release - DLL OpenSSL\libcurl.lib"; DestDir: "{app}\{#Arch}\external\lib"; Components: External\curl\v7_50_1\ossl

; External dep - curl WinSSPI
Source: "{#ROOT}\libs\curl\7.50.1\{#ArchName}\{#RT}\DLL Release - DLL Windows SSPI\curl.exe"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\curl\v7_50_1\sspi
Source: "{#ROOT}\libs\curl\7.50.1\{#ArchName}\{#RT}\DLL Release - DLL Windows SSPI\libcurl.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\curl\v7_50_1\sspi
Source: "{#ROOT}\libs\curl\7.50.1\{#ArchName}\{#RT}\DLL Release - DLL Windows SSPI\libcurl.lib"; DestDir: "{app}\{#Arch}\external\lib"; Components: External\curl\v7_50_1\sspi
