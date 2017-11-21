
#if LIBUV_DEFAULT_VERSION==LIBUV_VERSION
#  define protected LIBUV_IS_DEFAULT
#endif

#ifdef LIBUV_IS_DEFAULT
#  define protected DYNAMIC_TYPES "FullDynamic"
#  define protected STATIC_TYPES "FullStatic"
#else
#  define protected DYNAMIC_TYPES
#  define protected STATIC_TYPES
#endif

#if Copy(LIBUV_VERSION, 4, 1)=="."
#  define protected LIBUV_VERSION_NAME = "v" + Copy(LIBUV_VERSION, 1, 1) + "_" + Copy(LIBUV_VERSION, 3, 1) + "_" + Copy(LIBUV_VERSION, 5)
#else
#  define protected LIBUV_VERSION_NAME = "v" + Copy(LIBUV_VERSION, 1, 1) + "_" + Copy(LIBUV_VERSION, 3, 2) + "_" + Copy(LIBUV_VERSION, 6)
#endif

[Components]
Name: "External\libuv\{#LIBUV_VERSION_NAME}";         Description: "{#LIBUV_VERSION}";  Flags: exclusive
Name: "External\libuv\{#LIBUV_VERSION_NAME}\dynamic"; Description: "Dynamic";           Flags: exclusive; Types: {#DYNAMIC_TYPES}
Name: "External\libuv\{#LIBUV_VERSION_NAME}\static";  Description: "Static";            Flags: exclusive; Types: {#STATIC_TYPES}

[Files]
Source: "{#ROOT}\libs\libuv\{#LIBUV_VERSION}\lic\*";     DestDir: "{app}\{#Arch}\external\lic\libuv"; Flags: recursesubdirs; Components: External\libuv\{#LIBUV_VERSION_NAME}
Source: "{#ROOT}\libs\libuv\{#LIBUV_VERSION}\include\*"; DestDir: "{app}\{#Arch}\external\include";   Flags: recursesubdirs; Components: External\libuv\{#LIBUV_VERSION_NAME}

; External dep - libuv dynamic
Source: "{#ROOT}\libs\libuv\{#LIBUV_VERSION}\{#ArchName}\{#RT}\dynamic\libuv.lib"; DestDir: "{app}\{#Arch}\external\lib"; Components: External\libuv\{#LIBUV_VERSION_NAME}\dynamic
Source: "{#ROOT}\libs\libuv\{#LIBUV_VERSION}\{#ArchName}\{#RT}\dynamic\libuv.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\libuv\{#LIBUV_VERSION_NAME}\dynamic

; External dep - libuv static
Source: "{#ROOT}\libs\libuv\{#LIBUV_VERSION}\{#ArchName}\{#RT}\static\libuv.lib"; DestDir: "{app}\{#Arch}\external\lib"; Components: External\libuv\{#LIBUV_VERSION_NAME}\static
