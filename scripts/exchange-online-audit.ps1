Import-Module ExchangeOnlineManagement

Connect-ExchangeOnline

$ErrorActionPreference = 'Continue'
$output = 'audits/exchange-online-audit.json'

$mailboxes = Get-EXOMailbox -ResultSize Unlimited | Select-Object DisplayName, UserPrincipalName, RecipientTypeDetails, PrimarySmtpAddress, WhenCreated, IsShared, LitigationHoldEnabled, RetentionPolicy
$sharedMailboxes = Get-EXOMailbox -RecipientTypeDetails SharedMailbox -ResultSize Unlimited | Select-Object DisplayName, PrimarySmtpAddress, WhenCreated
$transportRules = Get-TransportRule | Select-Object Name, State, Mode, Priority, Enabled, WhenChanged
$inboundConnectors = Get-InboundConnector | Select-Object Name, Enabled, ConnectorType, SenderIPAddresses, SenderDomains, WhenChanged
$outboundConnectors = Get-OutboundConnector | Select-Object Name, Enabled, ConnectorType, RecipientDomains, SmartHosts, WhenChanged
$acceptedDomains = Get-AcceptedDomain | Select-Object Name, DomainName, DomainType, Default
$emailAddressPolicies = Get-EmailAddressPolicy | Select-Object Name, EnabledPrimarySMTPAddressTemplate, RecipientFilter, Priority, IncludedRecipients
$retentionPolicies = Get-RetentionPolicy | Select-Object Name, IsDefault, RetentionPolicyTagLinks
$retentionTags = Get-RetentionPolicyTag | Select-Object Name, Type, RetentionEnabled, AgeLimitForRetention, RetentionAction

$data = [PSCustomObject]@{
    GeneratedOn          = Get-Date
    Mailboxes            = $mailboxes
    SharedMailboxes      = $sharedMailboxes
    TransportRules       = $transportRules
    InboundConnectors    = $inboundConnectors
    OutboundConnectors   = $outboundConnectors
    AcceptedDomains      = $acceptedDomains
    EmailAddressPolicies = $emailAddressPolicies
    RetentionPolicies    = $retentionPolicies
    RetentionTags        = $retentionTags
}

$data | ConvertTo-Json -Depth 8 | Out-File $output

Get-Item $output | Select-Object FullName, Length
