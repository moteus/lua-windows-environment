
#if LIBXML2_DEFAULT_VERSION==LIBXML2_VERSION
#  define protected LIBXML2_IS_DEFAULT
#endif

#ifdef LIBXML2_IS_DEFAULT
#  define protected DYNAMIC_TYPES "FullDynamic FullStatic"
#  define protected STATIC_TYPES
#else
#  define protected DYNAMIC_TYPES
#  define protected STATIC_TYPES
#endif

#if Copy(LIBXML2_VERSION, 4, 1)=="."
#  define protected LIBXML2_VERSION_NAME = "v" + Copy(LIBXML2_VERSION, 1, 1) + "_" + Copy(LIBXML2_VERSION, 3, 1) + "_" + Copy(LIBXML2_VERSION, 5)
#else
#  define protected LIBXML2_VERSION_NAME = "v" + Copy(LIBXML2_VERSION, 1, 1) + "_" + Copy(LIBXML2_VERSION, 3, 2) + "_" + Copy(LIBXML2_VERSION, 6)
#endif

[Components]
Name: "External\libxml2\{#LIBXML2_VERSION_NAME}";         Description: "{#LIBXML2_VERSION}";  Flags: exclusive
Name: "External\libxml2\{#LIBXML2_VERSION_NAME}\dynamic"; Description: "Dynamic";             Flags: exclusive; Types: {#DYNAMIC_TYPES}

[Files]
Source: "{#ROOT}\libs\libxml2\{#LIBXML2_VERSION}\lic\*";     DestDir: "{app}\{#Arch}\external\lic\libxml2"; Flags: recursesubdirs; Components: External\libxml2\{#LIBXML2_VERSION_NAME}
Source: "{#ROOT}\libs\libxml2\{#LIBXML2_VERSION}\include\*"; DestDir: "{app}\{#Arch}\external\include";   Flags: recursesubdirs; Components: External\libxml2\{#LIBXML2_VERSION_NAME}

; External dep - libxml2 dynamic
Source: "{#ROOT}\libs\libxml2\{#LIBXML2_VERSION}\{#ArchName}\{#RT}\dynamic\libxml2.lib"; DestDir: "{app}\{#Arch}\external\lib"; Components: External\libxml2\{#LIBXML2_VERSION_NAME}\dynamic
Source: "{#ROOT}\libs\libxml2\{#LIBXML2_VERSION}\{#ArchName}\{#RT}\dynamic\libxml2.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\libxml2\{#LIBXML2_VERSION_NAME}\dynamic
