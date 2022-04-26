# ChangePwdADusers_Powershell
Repository with script to force a user from Active Directory to set a new password at the next login via Windows Powershell.

**!!**: When you see this, is recommended to execute or do it as Administrator. 
## Prerquisites:
For execute the code, you **MUST** need:
- **RSAT** (Remote System Administration Tools).
- CSV file with users to change the password. 

**You can do it manually or you can [use a code](https://github.com/joanmateo71/ChangePwdAD_Powershell/blob/main/ScriptPwd.ps1) that make all the process automatically.**

## Step-by-Step
**1.- Install RSAT Tools.** *!!* <br>
If you don't have the Remote System Administration Tools, you can download it with this command:
```powershell
Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability –Online
```
**2.- Obtain users.** <br>
You must need a list of users that you want to change the password. I prefer to use sAMAccountName to obtain the username. Export it and save it in a CSV.

**3.- Write and execute the code.** *!!* <br>
When you get the CSV file, you can copy and paste this code in Powershell ISE. Basically the script import from a CSV file and for each value (sAMAccountName), at the next login, the user must need to set a new password.

```powershell
Import-Csv A:\route\to\file.csv | ForEach {
  Set-ADUser -Identity $_.sAMAccountName -ChangePasswordAtLogon $True
}
```

And that's it :)
