# I'm writing the code, pls wait
echo "Welcome to ADchangePwd."

$rsatAD = Get-WindowsFeature | Where {$_.Name -eq "RSAT-AD-Tools"}
if($rsatAD.Installed -eq "False"){
    echo "RSAT Tools are not installed on the computer. Proceeding to install it."
    Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability –Online    
    }

echo "Copy and paste the route "