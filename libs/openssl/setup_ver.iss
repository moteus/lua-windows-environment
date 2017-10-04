#if OPENSSL_DEFAULT_VERSION==OPENSSL_VERSION
#define protected OPENSSL_IS_DEFAULT
#endif

#if Copy(OPENSSL_VERSION, 1, 3)=="1.0"
#define protected OPENSSL_HAS_STATIC
#endif

#ifdef OPENSSL_IS_DEFAULT
#  ifdef OPENSSL_HAS_STATIC
#    define protected DYNAMIC_TYPES "FullDynamic"
#    define protected STATIC_TYPES "FullStatic"
#  else
#    define protected DYNAMIC_TYPES "FullDynamic FullStatic"
#    define protected STATIC_TYPES
#  endif
#else
#    define protected DYNAMIC_TYPES
#    define protected STATIC_TYPES
#endif

#define protected OPENSSL_VERSION_NAME = "v" + Copy(OPENSSL_VERSION, 1, 1) + "_" + Copy(OPENSSL_VERSION, 3, 1) + "_" + Copy(OPENSSL_VERSION, 5)


[Components]
; OpenSSL
Name: "External\OpenSSL\{#OPENSSL_VERSION_NAME}"; Description: {#OPENSSL_VERSION}; Flags: exclusive

Name: "External\OpenSSL\{#OPENSSL_VERSION_NAME}\dynamic"; Description: "Dynamic"; Flags: exclusive; Types: {#DYNAMIC_TYPES}
#ifdef OPENSSL_HAS_STATIC
Name: "External\OpenSSL\{#OPENSSL_VERSION_NAME}\static"; Description: "Static"; Flags: exclusive; Types: {#STATIC_TYPES}
#endif

[Files]
; External dep - OpenSSL License
Source: "{#ROOT}\libs\openssl\{#OPENSSL_VERSION}\lic\*"; DestDir: "{app}\{#Arch}\external\lic\openssl"; Flags: recursesubdirs; Components: External\OpenSSL\{#OPENSSL_VERSION_NAME}

; External dep - OpenSSL dynamic
Source: "{#ROOT}\libs\openssl\{#OPENSSL_VERSION}\{#ArchName}\{#RT}\dynamic\*"; DestDir: "{app}\{#Arch}\external"; Excludes: "openssl.cnf"; Flags: recursesubdirs; Components: External\OpenSSL\{#OPENSSL_VERSION_NAME}\dynamic
Source: "{#ROOT}\libs\openssl\{#OPENSSL_VERSION}\{#ArchName}\{#RT}\dynamic\*"; DestDir: "{#OPENSSL_CONF_BASE}\{#OPENSSL_VERSION}\{#Arch}"; Flags: recursesubdirs; Components: External\OpenSSL\{#OPENSSL_VERSION_NAME}\dynamic; Tasks: OpenSSLConf/default

; External dep - OpenSSL static
#ifdef OPENSSL_HAS_STATIC
Source: "{#ROOT}\libs\openssl\{#OPENSSL_VERSION}\{#ArchName}\{#RT}\static\*"; DestDir: "{app}\{#Arch}\external"; Excludes: "openssl.cnf"; Flags: recursesubdirs; Components: External\OpenSSL\{#OPENSSL_VERSION_NAME}\static
Source: "{#ROOT}\libs\openssl\{#OPENSSL_VERSION}\{#ArchName}\{#RT}\static\*"; DestDir: "{#OPENSSL_CONF_BASE}\{#OPENSSL_VERSION}\{#Arch}"; Flags: recursesubdirs; Components: External\OpenSSL\{#OPENSSL_VERSION_NAME}\static; Tasks: OpenSSLConf/default
#endif
