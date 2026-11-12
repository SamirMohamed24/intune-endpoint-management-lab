# 01 – Tenant setup

**Goal:** prepare the Microsoft 365 tenant so devices can enroll in Intune.

## 1. Create an admin account
The tenant was created with a personal Microsoft account. Personal accounts cannot sign in to the Microsoft 365 admin center or join Windows to Entra ID, so I created a work account.

*Entra admin center → Users → New user*

| Account | Purpose | Role |
|---|---|---|
| `labadmin@<tenant>.onmicrosoft.com` | Administration, Autopilot upload | Global Administrator |
| `testuser@<tenant>.onmicrosoft.com` | Sign-in on VM 1 | None (standard user) |
| `TestUser2@<tenant>.onmicrosoft.com` | Sign-in on VM 2 | None (standard user) |

Usage location set to **Sweden** on every user (required for licensing).

![New user](images/01-new-user.png)

## 2. License – Microsoft 365 E5 trial
*M365 admin center → Marketplace → Microsoft 365 E5 → Start free trial*

E5 includes Intune Plan 1 and Entra ID P1/P2.

## 3. Group-based licensing
Instead of licensing users one by one, I assigned the license to a group.

- Group: `SG-License-M365-E5` (Security, Assigned)
- Members: labadmin, testuser, TestUser2
- *Billing → Licenses → Microsoft 365 E5 → Groups → Assign licenses*

Verify on the user: *Licenses → Assignment path: Inherited (SG-License-M365-E5)*.

![Group-based license](images/01-group-license.png)

## 4. Automatic MDM enrollment
*Intune → Devices → Enrollment → Windows → Automatic Enrollment*

- **MDM user scope:** All
- **MAM user scope:** None

