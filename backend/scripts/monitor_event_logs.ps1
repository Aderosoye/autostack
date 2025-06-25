<#
.SYNOPSIS
Monitors Windows Event Logs for critical or error events and sends an email alert.

.DESCRIPTION
Filters recent critical/error events from the System log and sends an email summary.

.NOTES
Requires configured SMTP client.

.EXAMPLE
./monitor_event_logs.ps1
#>

$events = Get-WinEvent -LogName System -FilterXPath "*[System[(Level=1 or Level=2)]]" -MaxEvents 20
if ($events.Count -gt 0) {
    $body = $events | Select-Object -Property TimeCreated, Id, LevelDisplayName, Message | Out-String
    Send-MailMessage -From "alert@autostack.local" -To "admin@company.com" -Subject "AutoStack: Critical Events Detected" -Body $body -SmtpServer "smtp.company.com"
    Write-Output "Alert sent. $($events.Count) critical events found."
} else {
    Write-Output "No critical events detected."
}