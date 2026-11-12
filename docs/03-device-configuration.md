# 03 – Device configuration: block removable storage

**Goal:** block USB and CD/DVD storage with a Settings catalog policy and verify it on the client.

## 1. Policy
*Devices → Configuration → Create → Windows 10 and later → Settings catalog*

| Setting | Value |
|---|---|
| Name | Blockera USB-minnen |
| Administrative Templates → System → Removable Storage Access → **All Removable Storage classes: Deny all access** | Enabled |
| Assignment | SG-Autopilot-Devices-Lab |

![Policy settings](images/03-policy-settings.png)

## 2. Verify in Intune
*Policy → Device and user check-in status* → **Succeeded: 1**

![Succeeded](images/03-policy-succeeded.png)
![Device configuration on LAB-13426](images/03-device-configuration.png)

## 3. Verify on the client
```powershell
reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\RemovableStorageDevices"
```

![Deny_All = 1](images/03-registry-deny-all.png)

Hyper-V has no USB pass-through, so I tested with a virtual DVD drive (*Media → DVD Drive → Insert disk*). The policy also covers CD/DVD.

Result: **"D:\ is not accessible. Access is denied."**

![Access denied](images/03-access-denied.png)
