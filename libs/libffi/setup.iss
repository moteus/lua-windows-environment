; ==========================================================================
; External dep - libffi
; ==========================================================================

[Components]
#if Arch == "x86"
Name: "External\libffi"; Description: "libffi"
Name: "External\libffi\static";  Description: "Static"; Flags: exclusive
#endif

[Files]
#if Arch == "x86"

Source: "{#ROOT}\libs\libffi\lic\*"; DestDir: "{app}\{#Arch}\external\lic\libffi"; Flags: recursesubdirs; Components: External\libffi
Source: "{#ROOT}\libs\libffi\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\libffi

; External dep - libffi static
Source: "{#ROOT}\libs\libffi\{#ArchName}\{#RT}\static\libffi.lib"; DestDir: "{app}\{#Arch}\external\lib"; DestName: ffi.lib; Components: External\libffi\static

#endif
