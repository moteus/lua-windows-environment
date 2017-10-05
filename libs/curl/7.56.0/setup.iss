; ==========================================================================
; External dep - cURL 7.56.0
; ==========================================================================

#define protected CURL_VERSION "7.56.0"
#define protected CURL_VERSION_NAME "v7_56_0"
#define protected OPENSSL_VERSION_1_0 "1.0.2l"
#define protected OPENSSL_VERSION_1_1 "1.1.0f"

[Components]
Name: "External\curl\{#CURL_VERSION_NAME}"; Description: "{#CURL_VERSION}"; Flags: exclusive
Name: "External\curl\{#CURL_VERSION_NAME}\sspi"; Description: "DLL WinSSPI"; Flags: exclusive; Types: FullDynamic FullStatic
Name: "External\curl\{#CURL_VERSION_NAME}\ossl_1_0"; Description: "DLL OpenSSL (1.0.x) "; Flags: exclusive;
Name: "External\curl\{#CURL_VERSION_NAME}\ossl_1_1"; Description: "DLL OpenSSL (1.1.x) "; Flags: exclusive;

[Files]
Source: "{#ROOT}\libs\curl\{#CURL_VERSION}\lic\*"; DestDir: "{app}\{#Arch}\external\lic\curl"; Flags: recursesubdirs; Components: External\curl\{#CURL_VERSION_NAME}
Source: "{#ROOT}\libs\curl\{#CURL_VERSION}\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\curl\{#CURL_VERSION_NAME}

; External dep - curl OpenSSL(1.0)
Source: "{#ROOT}\libs\curl\{#CURL_VERSION}\{#ArchName}\{#RT}\DLL Release - DLL OpenSSL\{#OPENSSL_VERSION_1_0}\curl.exe"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\curl\{#CURL_VERSION_NAME}\ossl_1_0
Source: "{#ROOT}\libs\curl\{#CURL_VERSION}\{#ArchName}\{#RT}\DLL Release - DLL OpenSSL\{#OPENSSL_VERSION_1_0}\libcurl.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\curl\{#CURL_VERSION_NAME}\ossl_1_0
Source: "{#ROOT}\libs\curl\{#CURL_VERSION}\{#ArchName}\{#RT}\DLL Release - DLL OpenSSL\{#OPENSSL_VERSION_1_0}\libcurl.lib"; DestDir: "{app}\{#Arch}\external\lib"; Components: External\curl\{#CURL_VERSION_NAME}\ossl_1_0

; External dep - curl OpenSSL(1.1)
Source: "{#ROOT}\libs\curl\{#CURL_VERSION}\{#ArchName}\{#RT}\DLL Release - DLL OpenSSL\{#OPENSSL_VERSION_1_1}\curl.exe"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\curl\{#CURL_VERSION_NAME}\ossl_1_1
Source: "{#ROOT}\libs\curl\{#CURL_VERSION}\{#ArchName}\{#RT}\DLL Release - DLL OpenSSL\{#OPENSSL_VERSION_1_1}\libcurl.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\curl\{#CURL_VERSION_NAME}\ossl_1_1
Source: "{#ROOT}\libs\curl\{#CURL_VERSION}\{#ArchName}\{#RT}\DLL Release - DLL OpenSSL\{#OPENSSL_VERSION_1_1}\libcurl.lib"; DestDir: "{app}\{#Arch}\external\lib"; Components: External\curl\{#CURL_VERSION_NAME}\ossl_1_1

; External dep - curl WinSSPI
Source: "{#ROOT}\libs\curl\{#CURL_VERSION}\{#ArchName}\{#RT}\DLL Release - DLL Windows SSPI\curl.exe"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\curl\{#CURL_VERSION_NAME}\sspi
Source: "{#ROOT}\libs\curl\{#CURL_VERSION}\{#ArchName}\{#RT}\DLL Release - DLL Windows SSPI\libcurl.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\curl\{#CURL_VERSION_NAME}\sspi
Source: "{#ROOT}\libs\curl\{#CURL_VERSION}\{#ArchName}\{#RT}\DLL Release - DLL Windows SSPI\libcurl.lib"; DestDir: "{app}\{#Arch}\external\lib"; Components: External\curl\{#CURL_VERSION_NAME}\sspi
