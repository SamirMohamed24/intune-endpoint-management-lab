# Screenshots to add

Save each image in `docs/images/` with exactly this name. Blur recovery keys, LAPS passwords and tenant IDs.

The CI workflow lists any screenshot that is still missing as a warning.

| File | What to capture |
|---|---|
| ⬜ 01-new-user.png | Entra: creating labadmin / test user |
| ⬜ 01-group-license.png | User → Licenses, *Inherited (SG-License-M365-E5)* |
| ⬜ 02-vm-security.png | Hyper-V VM settings: Secure Boot + TPM enabled |
| ✅ 02-hash-uploaded.png | PowerShell: "1 devices imported successfully" |
| ⬜ 02-dynamic-group.png | SG-Autopilot-Devices-Lab dynamic rule |
| ✅ 02-profile-assigned.png | Windows Autopilot devices: Profile status Assigned |
| ⬜ 02-oobe-signin.png | OOBE sign-in with the organization |
| ⬜ 02-dsregcmd.png | `dsregcmd /status` – AzureAdJoined YES |
| ✅ 02-intune-device.png | Intune device page (enrollment profile AutopilotLabProfile) |
| ⬜ 03-policy-settings.png | Settings catalog: Deny all access |
| ✅ 03-policy-succeeded.png | Policy status Succeeded: 1 |
| ✅ 03-access-denied.png | "D:\ is not accessible. Access is denied." |
| ✅ 04-laps-policy.png | LAPS policy settings |
| ✅ 04-laps-password.png | Local admin password page (password hidden) |
| ✅ 05-bitlocker-policy.png | BitLocker policy settings |
| ✅ 05-manage-bde-before.png | Protection Off, no key protectors |
| ✅ 05-manage-bde-after.png | Protection On, TPM + Numerical Password |
| ✅ 05-recovery-key-intune.png | BitLocker recovery keys in Intune (key blurred) |
| ⬜ 05-recovery-screen.png | Blue BitLocker recovery screen |
| ✅ 06-intunewinapputil.png | IntuneWinAppUtil output / .intunewin in Output |
| ✅ 06-program-tab.png | 7-Zip Program tab |
| ✅ 06-requirements.png | 7-Zip Requirements tab |
| ✅ 06-company-portal.png | Company Portal: 7-Zip installed |
| ✅ 07-920-installed.png | Company Portal: 7-Zip 9.20 installed |
| ✅ 07-supersedence-settings.png | 26.05 supersedence on 9.20, uninstall Yes |
| ✅ 07-notifications.png | Notification Center: replaced → uninstalled → installed |
| ⬜ 07-2605-installed.png | Company Portal: 7-Zip 26.05 installed |
| ⬜ 08-template-folder.png | NotepadPP PSADT folder structure |
| ⬜ 08-detection-rule.png | Registry detection rule DisplayVersion ≥ 8.9.8.1 |
| ✅ 08-company-portal.png | Company Portal: Notepad++ installed |
| ⬜ 08-psadt-log.png | PSADT log in C:\Windows\Logs\Software |
| ✅ 09-vcredist-app.png | VC++ app with no assignments |
| ✅ 09-dependency-settings.png | Notepad++ dependency on VC++, auto install Yes |
| ✅ 09-notifications.png | "dependency (1 of 1) … as part of the Notepad++ installation" |
| ⬜ 10-update-ring.png | WU-Ring-Pilot in Intune |
| ⬜ 10-client-managed.png | Windows Update: "managed by your organization", deadline |
| ✅ 10-before-win10.png | `ver` 10.0.19045 / Intune device list with both VMs |
| ✅ 10-installing.png | Windows 11 26H2 "Installing 33%" |
| ⬜ 10-after-win11.png | `ver` 10.0.26300 + update history "installed" |
| ⬜ 10-intune-after.png | Intune LAB-46792: OS version 10.0.26300.9457 |
