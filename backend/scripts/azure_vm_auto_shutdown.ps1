<#
.SYNOPSIS
Schedules auto-shutdown for Azure Virtual Machines to save costs.

.DESCRIPTION
Uses Azure CLI to enable auto-shutdown at specified times for a list of VMs.

.EXAMPLE
./azure_vm_auto_shutdown.ps1 -ResourceGroup "rg-prod" -VMName "vm-web01" -Time "1800"
#>

param(
    [string]$ResourceGroup,
    [string]$VMName,
    [string]$Time = "1800"  # Format: HHMM
)

az vm auto-shutdown -g $ResourceGroup -n $VMName --time $Time --email "admin@company.com" --enabled true
Write-Output "Auto-shutdown set for $VMName at $Time"