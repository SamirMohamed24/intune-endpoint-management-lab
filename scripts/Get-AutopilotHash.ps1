<#
.SYNOPSIS
    Uploads the device hardware hash to Windows Autopilot (run from OOBE with Shift+F10 -> powershell).
.NOTES
    Sign in with an Intune administrator (work or school account) when prompted.
#>
param([string]$GroupTag = "Lab")

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force
$env:Path += ";C:\Program Files\WindowsPowerShell\Scripts"

Install-Script -Name Get-WindowsAutopilotInfo -Force

# WAM sign-in often crashes in OOBE - use the browser/device sign-in instead
Import-Module Microsoft.Graph.Authentication
Set-MgGraphOption -DisableLoginByWAM $true

Get-WindowsAutopilotInfo -Online -GroupTag $GroupTag
