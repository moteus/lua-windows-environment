; ==========================================================================
; External dep - ZeroMQ
; ==========================================================================

[Components]
Name: "External\ZeroMQ"; Description: "ZeroMQ"
Name: "External\ZeroMQ\dynamic"; Description: "Dynamic"; Flags: exclusive; Types: FullDynamic FullStatic

[Files]
Source: "{#ROOT}\libs\ZeroMQ\lic\*"; DestDir: "{app}\{#Arch}\external\lic\ZeroMQ"; Flags: recursesubdirs; Components: External\ZeroMQ
Source: "{#ROOT}\libs\ZeroMQ\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\ZeroMQ

; External dep - ZeroMQ dynamic
Source: "{#ROOT}\libs\ZeroMQ\{#ArchName}\{#RT}\dynamic\libzmq.lib"; DestDir: "{app}\{#Arch}\external\lib"; Components: External\ZeroMQ\dynamic
Source: "{#ROOT}\libs\ZeroMQ\{#ArchName}\{#RT}\dynamic\libzmq.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\ZeroMQ\dynamic

