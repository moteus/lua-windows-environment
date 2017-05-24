; ==========================================================================
; External dep - ZeroMQ 4.2.2
; ==========================================================================

[Components]
Name: "External\ZeroMQ\v_4_2_2"; Description: "4.2.2"; Flags: exclusive
Name: "External\ZeroMQ\v_4_2_2\dynamic"; Description: "Dynamic"; Flags: exclusive

[Files]
Source: "{#ROOT}\libs\ZeroMQ\4.2.2\lic\*"; DestDir: "{app}\{#Arch}\external\lic\ZeroMQ"; Flags: recursesubdirs; Components: External\ZeroMQ\v_4_2_2
Source: "{#ROOT}\libs\ZeroMQ\4.2.2\include\*"; DestDir: "{app}\{#Arch}\external\include"; Flags: recursesubdirs; Components: External\ZeroMQ\v_4_2_2

; External dep - ZeroMQ dynamic
Source: "{#ROOT}\libs\ZeroMQ\4.2.2\{#ArchName}\{#RT}\dynamic\libzmq.lib"; DestDir: "{app}\{#Arch}\external\lib"; Components: External\ZeroMQ\v_4_2_2\dynamic
Source: "{#ROOT}\libs\ZeroMQ\4.2.2\{#ArchName}\{#RT}\dynamic\libzmq.dll"; DestDir: "{app}\{#Arch}\external\bin"; Components: External\ZeroMQ\v_4_2_2\dynamic

