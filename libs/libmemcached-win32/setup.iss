; ==========================================================================
; External dep - libmemcached
; ==========================================================================

[Components]
Name: "External\libmemcached"; Description: "libmemcached"
Name: "External\libmemcached\dynamic"; Description: "Dynamic"; Flags: exclusive

[Files]
Source: "{#ROOT}\libs\libmemcached-win32\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\libmemcached

; External dep - libyaml dynamic
Source: "{#ROOT}\libs\libmemcached-win32\{#ArchName}\{#RT}\dynamic\libmemcached.lib"; DestDir: "{app}\{#Arch}\external\lib"; Components: External\libmemcached\dynamic
Source: "{#ROOT}\libs\libmemcached-win32\{#ArchName}\{#RT}\dynamic\libmemcached.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\libmemcached\dynamic

