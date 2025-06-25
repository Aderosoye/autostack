<#
.SYNOPSIS
Automatically creates local or Active Directory users from a CSV input file.

.DESCRIPTION
This script reads a CSV file containing user information and creates users on the system or in Active Directory.

.INPUTS
CSV file with columns: Username, FullName, Password

.EXAMPLE
./auto_user_create.ps1 -CsvPath "users.csv" -CreateLocalUsers
#>

param(
    [string]$CsvPath = "users.csv",
    [switch]$CreateLocalUsers = $true
)

if (-Not (Test-Path $CsvPath)) {
    Write-Error "CSV file not found at path: $CsvPath"
    exit
}

$users = Import-Csv $CsvPath
foreach ($user in $users) {
    $username = $user.Username
    $fullname = $user.FullName
    $password = ConvertTo-SecureString $user.Password -AsPlainText -Force

    if ($CreateLocalUsers) {
        if (-Not (Get-LocalUser -Name $username -ErrorAction SilentlyContinue)) {
            New-LocalUser -Name $username -FullName $fullname -Password $password -Description "AutoStack Created"
            Add-LocalGroupMember -Group "Users" -Member $username
            Write-Output "Created local user: $username"
        } else {
            Write-Output "User $username already exists."
        }
    } else {
        # For AD environment
        New-ADUser -Name $fullname -SamAccountName $username -AccountPassword $password -Enabled $true
        Write-Output "Created AD user: $username"
    }
}