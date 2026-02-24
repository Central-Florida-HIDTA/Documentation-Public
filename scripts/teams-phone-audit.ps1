Import-Module MicrosoftTeams

Connect-MicrosoftTeams

$ErrorActionPreference = 'Continue'
$output = 'audits/teams-phone-audit.json'

$users = Get-CsOnlineUser | Where-Object { $_.LineURI -or $_.EnterpriseVoiceEnabled }
$autoAttendants = Get-CsAutoAttendant -ErrorAction SilentlyContinue
$callQueues = Get-CsCallQueue -ErrorAction SilentlyContinue
$resourceAccounts = Get-CsOnlineApplicationInstance -ErrorAction SilentlyContinue
$pstnGateways = Get-CsOnlinePstnGateway -ErrorAction SilentlyContinue

$data = [PSCustomObject]@{
    GeneratedOn      = Get-Date
    Users            = $users
    AutoAttendants   = $autoAttendants
    CallQueues       = $callQueues
    ResourceAccounts = $resourceAccounts
    PstnGateways     = $pstnGateways
}

$data | ConvertTo-Json -Depth 8 | Out-File $output

Get-Item $output | Select-Object FullName, Length
