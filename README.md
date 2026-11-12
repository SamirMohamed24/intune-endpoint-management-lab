# Intune & Windows Autopilot Lab

[![CI](https://github.com/SamirMohamed24/intune-endpoint-management-lab/actions/workflows/ci.yml/badge.svg)](https://github.com/SamirMohamed24/intune-endpoint-management-lab/actions/workflows/ci.yml)
[![Docs](https://github.com/SamirMohamed24/intune-endpoint-management-lab/actions/workflows/pages.yml/badge.svg)](https://samirmohamed24.github.io/intune-endpoint-management-lab/)

📖 **Read it as a website:** https://samirmohamed24.github.io/intune-endpoint-management-lab/

A hands-on Microsoft Intune lab built on Hyper-V. It covers the full device lifecycle: Autopilot enrollment, security policies, Win32 app packaging (including PSAppDeployToolkit), and Windows Update management, including an upgrade from Windows 10 to Windows 11 through Intune.

Every lab is documented step by step.

## Lab environment

| Component | Details |
|---|---|
| Hypervisor | Hyper-V on Windows 11 |
| VM 1 – `LAB-13426` | Windows 11 26H2, Gen 2, vTPM, Secure Boot, 4 GB RAM, 2 vCPU |
| VM 2 – `LAB-46792` | Installed as Windows 10 22H2, upgraded to Windows 11 26H2 via Intune |
| Phone | Android 10, personally-owned work profile |
| Tenant | Microsoft 365 E5 trial (Intune + Entra ID P1/P2) |
| Join type | Microsoft Entra joined (cloud only) |
| Tools | Intune admin center, Entra admin center, PowerShell, IntuneWinAppUtil, PSAppDeployToolkit 4.1.8 |

## Labs

| # | Lab | Skills |
|---|---|---|
| 01 | [Tenant setup](docs/01-tenant-setup.md) | Admin and test users, group-based licensing, MDM user scope |
| 02 | [Windows Autopilot](docs/02-autopilot.md) | Hardware hash, dynamic device group, deployment profile, user-driven Entra join |
| 03 | [Device configuration](docs/03-device-configuration.md) | Settings catalog, block removable storage, verification on the client |
| 04 | [Windows LAPS](docs/04-laps.md) | Entra LAPS, automatic account management, Windows 10 vs 11 behaviour |
| 05 | [BitLocker](docs/05-bitlocker.md) | Silent encryption, key escrow to Entra, recovery test |
| 06 | [Win32 app – 7-Zip (MSI)](docs/06-win32-app-7zip.md) | .intunewin packaging, requirement and detection rules, Required vs Available |
| 07 | [Supersedence](docs/07-supersedence.md) | Replace 7-Zip 9.20 with 26.05, uninstall previous version |
| 08 | [PSADT – Notepad++ (EXE)](docs/08-psadt-notepadpp.md) | PSAppDeployToolkit v4, close running apps, registry detection with version check |
| 09 | [Dependencies](docs/09-dependencies.md) | VC++ Redistributable installed automatically before Notepad++ |
| 10 | [Windows Update](docs/10-windows-update.md) | Update rings, feature update policy, Win10 → Win11 upgrade |
| 11 | [Defender for Endpoint](docs/11-defender.md) | Antivirus policy, EDR onboarding, tamper protection, EICAR detection and alert triage |
| 12 | [Android work profile](docs/12-android.md) | Managed Google Play, BYOD enrollment with Company Portal |
| 13 | [Endpoint Privilege Management](docs/13-epm.md) | Elevation settings and rules, certificate rule locked to a protected path |

## Scripts

| Script | Purpose |
|---|---|
| [`Get-AutopilotHash.ps1`](scripts/Get-AutopilotHash.ps1) | Upload the hardware hash from OOBE |
| [`psadt-notepadpp/Invoke-AppDeployToolkit.ps1`](scripts/psadt-notepadpp/Invoke-AppDeployToolkit.ps1) | PSADT package for Notepad++ |
| [`Fix-BitLockerActivation.ps1`](scripts/Fix-BitLockerActivation.ps1) | Add protectors and back up the recovery key to Entra |
| [`Extend-CDrive.ps1`](scripts/Extend-CDrive.ps1) | Extend C: after expanding the VHDX (removes the recovery partition) |

## Repository automation

| Workflow | What it does |
|---|---|
| `ci.yml` | Lints all PowerShell scripts with PSScriptAnalyzer, reports missing screenshots and test-builds the documentation site |
| `pages.yml` | Builds the docs with MkDocs Material and publishes them to GitHub Pages on every push to `main` |

## Author

Samir Mohamed – IT support / client management  
GitHub: [SamirMohamed24](https://github.com/SamirMohamed24) · Related: [SCCM Hyper-V lab](https://github.com/SamirMohamed24/sccm-hyperv-lab)
