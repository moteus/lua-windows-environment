; ==========================================================================
; External dep - cURL
; ==========================================================================

[Components]
Name: "External\curl"; Description: "cURL"
Name: "External\curl\sspi"; Description: "DLL WinSSPI"; Flags: exclusive; Types: FullDynamic FullStatic
Name: "External\curl\ossl"; Description: "DLL OpenSSL"; Flags: exclusive;

[Files]
Source: "{#ROOT}\libs\curl\lic\*"; DestDir: "{app}\{#Arch}\external\lic\curl"; Flags: recursesubdirs; Components: External\curl
Source: "{#ROOT}\libs\curl\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\curl

; External dep - curl OpenSSL
Source: "{#ROOT}\libs\curl\{#ArchName}\{#RT}\DLL Release - DLL OpenSSL\curl.exe"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\curl\ossl
Source: "{#ROOT}\libs\curl\{#ArchName}\{#RT}\DLL Release - DLL OpenSSL\libcurl.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\curl\ossl
Source: "{#ROOT}\libs\curl\{#ArchName}\{#RT}\DLL Release - DLL OpenSSL\libcurl.lib"; DestDir: "{app}\{#Arch}\external\lib"; Components: External\curl\ossl

; External dep - curl WinSSPI
Source: "{#ROOT}\libs\curl\{#ArchName}\{#RT}\DLL Release - DLL Windows SSPI\curl.exe"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\curl\sspi
Source: "{#ROOT}\libs\curl\{#ArchName}\{#RT}\DLL Release - DLL Windows SSPI\libcurl.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\curl\sspi
Source: "{#ROOT}\libs\curl\{#ArchName}\{#RT}\DLL Release - DLL Windows SSPI\libcurl.lib"; DestDir: "{app}\{#Arch}\external\lib"; Components: External\curl\sspi
