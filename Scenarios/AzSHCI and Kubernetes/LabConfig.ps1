$LabConfig=@{ DomainAdminName='LabAdmin'; AdminPassword='LS1setup!' ; Prefix = 'MSLab-' ; DCEdition='4'; Internet=$true ; TelemetryLevel='Full' ; TelemetryNickname='' ; AdditionalNetworksConfig=@(); VMs=@()}

#2 nodes for AzSHCI Cluster
1..2 | ForEach-Object {$VMNames="AzSHCI" ; $LABConfig.VMs += @{ VMName = "$VMNames$_" ; Configuration = 'S2D' ; ParentVHD = 'AzSHCI20H2_G2.vhdx' ; HDDNumber = 4 ; HDDSize= 4TB ; MemoryStartupBytes= 24GB; VMProcessorCount="Max" ; NestedVirt=$true ; VirtualTPM=$true}}

#or 2 nodes for AzSHCI 21H2 Cluster
#1..2 | ForEach-Object {$VMNames="AzSHCI" ; $LABConfig.VMs += @{ VMName = "$VMNames$_" ; Configuration = 'S2D' ; ParentVHD = 'AzSHCI21H2_G2.vhdx' ; HDDNumber = 4 ; HDDSize= 4TB ; MemoryStartupBytes= 24GB; VMProcessorCount="Max" ; NestedVirt=$true ; VirtualTPM=$true}}

#or 2 nodes for Windows Server 2022
#1..2 | ForEach-Object {$VMNames="AzSHCI" ; $LABConfig.VMs += @{ VMName = "$VMNames$_" ; Configuration = 'S2D' ; ParentVHD = 'Win2022Core_G2.vhdx' ; HDDNumber = 4 ; HDDSize= 4TB ; MemoryStartupBytes= 24GB; VMProcessorCount="Max" ; NestedVirt=$true ; VirtualTPM=$true}}

#Windows 10 management machine (for Windows Admin Center)
$LabConfig.VMs += @{ VMName = 'Win10'; ParentVHD = 'Win1020H1_G2.vhdx' ; AddToolsVHD = $True ; MGMTNICs=1 }

#or Windows 11 management machine (for Windows Admin Center)
$LabConfig.VMs += @{ VMName = 'Win11'; ParentVHD = 'Win1121H2_G2.vhdx' ; AddToolsVHD = $True ; MGMTNICs=1 }

#Windows Admin Center gateway
#$LabConfig.VMs += @{ VMName = 'WACGW' ; ParentVHD = 'Win2019Core_G2.vhdx' ; MGMTNICs=1 }
 