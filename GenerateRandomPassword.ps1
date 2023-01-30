Function GenerateRandomPassword ([Parameter(Mandatory=$true)][int]$PasswdLen)
{
Add-Type -AssemblyName System.Web
$PassCheck = $false
do {
$newPasswd=[System.Web.Security.Membership]::GeneratePassword($PasswdLen,1)
If ( ($newPasswd -cmatch "[A-Z\p{Lu}\s]") `
-and ($newPasswd -cmatch "[a-z\p{Ll}\s]") `
-and ($newPasswd -match "[\d]") `
-and ($newPasswd -match "[^\w]")
)
{
$PassCheck=$True
}
} While ($PassCheck -eq $false)
return $newPasswd 
}

GenerateRandomPassword (8)
