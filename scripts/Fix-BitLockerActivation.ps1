<#
.SYNOPSIS
    Fixes a BitLocker volume that is encrypted but "waiting for activation" (Protection Off, no key protectors).
    Adds a recovery password, backs it up to Entra ID, adds the TPM protector and turns protection on.
.NOTES
    Run as administrator.
#>
$mount = "C:"

manage-bde -protectors -add $mount -RecoveryPassword | Out-Null

$kp = (Get-BitLockerVolume -MountPoint $mount).KeyProtector |
      Where-Object KeyProtectorType -eq 'RecoveryPassword' | Select-Object -Last 1

# Back up the key BEFORE enabling protection
BackupToAAD-BitLockerKeyProtector -MountPoint $mount -KeyProtectorId $kp.KeyProtectorId

manage-bde -protectors -add $mount -TPM
manage-bde -protectors -enable $mount
manage-bde -status $mount
