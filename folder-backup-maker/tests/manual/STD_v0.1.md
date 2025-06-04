# Software Test Description v1.0

Script version: 0.1  
Date: 04/06/2025  
Author: Michael Shults

## Test Cases

### **TC01 - Set Up a Backup Folder**
- **Precondition:**
    1. FBMBackupLocation user environment variable should not be set
        - Delete it if set or empty
- **Steps:**
    1. Open the terminal with powershell
    2. cd to 'REPO/'
    3. Run  '.\folder-backup-maker.ps1 UpdateBackupPath BackupPath FIXTURE/backups/'
    4. Close and then open the terminal again
    5. Run '$env:FBMBackupLocation'
- **Expected Result:** 
    - Step 3: Script prints "Backup folder updated, please restart terminal for changes to apply." with no errors.
    - Step 5: Terminal prints "FIXTURE/backups/" 
- **Priority:** High



## Environment
- OS: Windows 11 Home, Version 10.0.26100, Build 26100
- Terminal: Windows Terminal 1.22.11141.0
- Powershell:
    1. Powershell version 5.1.26100.4202
    2. Windows Powershell version 7.5.1

## Folder Structure and Script Placement
- Test fixtures for this STD are located in /tests/manual/test-fixtures/basic-fixture/
    - We use 'FIXTURE/' for it as a placeholder
- Script should be located in folder-backup-maker/
    - We use 'REPO/' for it as a placeholder  




