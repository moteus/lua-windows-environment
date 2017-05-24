; ==========================================================================
; External dep - ZeroMQ 4.1.5
; ==========================================================================

[Components]
Name: "External\ZeroMQ\v_4_1_5"; Description: "4.1.5"; Flags: exclusive
Name: "External\ZeroMQ\v_4_1_5\dynamic"; Description: "Dynamic"; Flags: exclusive; Types: FullDynamic FullStatic

[Files]
Source: "{#ROOT}\libs\ZeroMQ\4.1.5\lic\*"; DestDir: "{app}\{#Arch}\external\lic\ZeroMQ"; Flags: recursesubdirs; Components: External\ZeroMQ\v_4_1_5
Source: "{#ROOT}\libs\ZeroMQ\4.1.5\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\ZeroMQ\v_4_1_5

; External dep - ZeroMQ dynamic
Source: "{#ROOT}\libs\ZeroMQ\4.1.5\{#ArchName}\{#RT}\dynamic\libzmq.lib"; DestDir: "{app}\{#Arch}\external\lib"; Components: External\ZeroMQ\v_4_1_5\dynamic
Source: "{#ROOT}\libs\ZeroMQ\4.1.5\{#ArchName}\{#RT}\dynamic\libzmq.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\ZeroMQ\v_4_1_5\dynamic

