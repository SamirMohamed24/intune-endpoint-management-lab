<#
.SYNOPSIS
    Extends C: after the VHDX has been expanded on the Hyper-V host.
    Removes the recovery partition that sits after C: and moves WinRE into C:.
.NOTES
    Run as administrator in 64-bit PowerShell. Check the partition list before removing anything.
#>
Get-Partition -DiskNumber 0 |
    Select-Object PartitionNumber, DriveLetter, Type, @{n='GB';e={[math]::Round($_.Size/1GB,1)}}

$recovery = Get-Partition -DiskNumber 0 | Where-Object Type -eq 'Recovery'
if ($recovery) {
    reagentc /disable
    Remove-Partition -DiskNumber 0 -PartitionNumber $recovery.PartitionNumber -Confirm:$false
}

Resize-Partition -DriveLetter C -Size (Get-PartitionSupportedSize -DriveLetter C).SizeMax
reagentc /enable

Get-Volume -DriveLetter C | Select-Object @{n='Size_GB';e={[math]::Round($_.Size/1GB)}}
