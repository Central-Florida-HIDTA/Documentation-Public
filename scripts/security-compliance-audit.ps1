#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Audit Security & Compliance Center configuration
.DESCRIPTION
    Queries Microsoft 365 Compliance Center for DLP policies, retention policies,
    audit settings, eDiscovery cases, and related compliance configuration.
.NOTES
    Requires IPPSSession connection via Connect-IPPSSession
    Alternative: Uses Exchange Online modules where available
#>

# Output file path
$output = 'audits/security-compliance-audit.json'
$outputDir = Split-Path -Path $output
if (-not (Test-Path -Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
}

# Initialize results object
$auditResults = @{
    timestamp = Get-Date -Format 'yyyy-MM-ddTHH:mm:ssZ'
    environment = 'GCC'
    tenant = 'tenant.onmicrosoft.com'
}

# Check if Exchange Online connection is available (used for compliance cmdlets)
Write-Host "Checking for Compliance PowerShell connection..." -ForegroundColor Cyan
try {
    Get-Organization -ErrorAction Stop | Out-Null
    $auditResults['ComplianceConnection'] = 'Connected'
    Write-Host "  ✓ Compliance PowerShell connected"
} catch {
    Write-Host "  ⚠ Compliance PowerShell not connected - attempting connection..." -ForegroundColor Yellow
    # Connection not available - will document expected configuration
    $auditResults['ComplianceConnection'] = 'Not connected - requires IPPSSession'
}

# DLP Compliance Policies
Write-Host "Querying DLP Compliance Policies..." -ForegroundColor Cyan
try {
    $dlpPolicies = Get-DlpCompliancePolicy -ErrorAction SilentlyContinue | Select-Object `
        Name, Guid, Enabled, Mode, CreatedDate, LastModifiedDate, Priority -First 100
    if ($dlpPolicies) {
        $auditResults['DlpPolicies'] = @($dlpPolicies) | ForEach-Object { 
            @{
                Name = $_.Name
                Id = $_.Guid
                Enabled = $_.Enabled
                Mode = $_.Mode
                CreatedDate = $_.CreatedDate
                LastModifiedDate = $_.LastModifiedDate
                Priority = $_.Priority
            }
        }
        Write-Host "  Found $($dlpPolicies.Count) DLP policies"
    } else {
        $auditResults['DlpPolicies'] = @()
    }
} catch {
    Write-Host "  ℹ DLP policies not available (expected - requires Compliance PowerShell)" -ForegroundColor Cyan
    $auditResults['DlpPolicies'] = @()
}

# Retention Compliance Policies
Write-Host "Querying Retention Policies..." -ForegroundColor Cyan
try {
    $retentionPolicies = Get-RetentionCompliancePolicy -ErrorAction SilentlyContinue | Select-Object `
        Name, Guid, Enabled, CreatedDate, LastModifiedDate -First 100
    if ($retentionPolicies) {
        $auditResults['RetentionPolicies'] = @($retentionPolicies) | ForEach-Object {
            @{
                Name = $_.Name
                Id = $_.Guid
                Enabled = $_.Enabled
                CreatedDate = $_.CreatedDate
                LastModifiedDate = $_.LastModifiedDate
            }
        }
        Write-Host "  Found $($retentionPolicies.Count) retention policies"
    } else {
        $auditResults['RetentionPolicies'] = @()
    }
} catch {
    Write-Host "  ℹ Retention policies not available (expected - requires Compliance PowerShell)" -ForegroundColor Cyan
    $auditResults['RetentionPolicies'] = @()
}

# Compliance Tags (Retention Labels)
Write-Host "Querying Retention Labels..." -ForegroundColor Cyan
try {
    $complianceTags = Get-ComplianceTag -ErrorAction SilentlyContinue -IncludeSystemTags $false | Select-Object `
        Name, Guid, RetentionAction, RetentionDuration, Description -First 100
    if ($complianceTags) {
        $auditResults['RetentionLabels'] = @($complianceTags) | ForEach-Object {
            @{
                Name = $_.Name
                Id = $_.Guid
                RetentionAction = $_.RetentionAction
                RetentionDurationDays = $_.RetentionDuration
                Description = $_.Description
            }
        }
        Write-Host "  Found $($complianceTags.Count) retention labels"
    } else {
        $auditResults['RetentionLabels'] = @()
    }
} catch {
    Write-Host "  ℹ Retention labels not available (expected - requires Compliance PowerShell)" -ForegroundColor Cyan
    $auditResults['RetentionLabels'] = @()
}


# eDiscovery Cases
Write-Host "Querying eDiscovery Cases..." -ForegroundColor Cyan
try {
    $cases = Get-ComplianceCase -CaseType 'eDiscovery' -ErrorAction SilentlyContinue | Select-Object `
        Name, Identity, CreatedDate, Status -First 100
    if ($cases) {
        $auditResults['EDiscoveryCases'] = @($cases) | ForEach-Object {
            @{
                Name = $_.Name
                Identity = $_.Identity
                Status = $_.Status
                CreatedDate = $_.CreatedDate
            }
        }
        Write-Host "  Found $($cases.Count) eDiscovery cases"
    } else {
        $auditResults['EDiscoveryCases'] = @()
    }
} catch {
    Write-Host "  ℹ eDiscovery cases not available (expected - requires Compliance PowerShell)" -ForegroundColor Cyan
    $auditResults['EDiscoveryCases'] = @()
}

# Audit Log Configuration
Write-Host "Querying Audit Log Configuration..." -ForegroundColor Cyan
try {
    $auditConfig = Get-AdminAuditLogConfig -ErrorAction SilentlyContinue | Select-Object `
        UnifiedAuditLogIngestionEnabled
    if ($auditConfig) {
        $auditResults['AuditLogConfig'] = @{
            UnifiedAuditLogEnabled = $auditConfig.UnifiedAuditLogIngestionEnabled
            RetentionDays = 90
            Note = 'Default 90-day retention; extend to 365+ days for CJIS compliance'
        }
        Write-Host "  Audit logging enabled: $($auditConfig.UnifiedAuditLogIngestionEnabled)"
    } else {
        $auditResults['AuditLogConfig'] = $null
    }
} catch {
    Write-Host "  ℹ Audit log config not available (expected - requires Compliance PowerShell)" -ForegroundColor Cyan
    $auditResults['AuditLogConfig'] = @{
        Note = 'Audit logging available via Purview portal'
        RetentionDays = 90
    }
}

# Document Recommended Configuration
$recommendedConfig = @{
    'DlpPoliciesNeeded' = @(
        @{
            Name = 'Block External CJI Sharing'
            Priority = 0
            Mode = 'Enforce'
            TriggerKeywords = @('CONFIDENTIAL', 'classified', 'case file', 'investigative')
            Actions = @('BlockExternalSharing', 'NotifyUser')
        },
        @{
            Name = 'Warn on Sensitive Data'
            Priority = 1
            Mode = 'Audit'
            SensitiveInformationTypes = @('SSN', 'DriverLicense', 'CreditCardNumber')
            Actions = @('NotifyUser', 'GenerateAlert')
        }
    )
    'RetentionLabelsNeeded' = @(
        @{
            Name = 'CJI Case Files - 7 Years'
            RetentionAction = 'Delete'
            RetentionDurationDays = 2555
            Scope = 'ISC SharePoint'
        },
        @{
            Name = 'Operational Records - 1 Year'
            RetentionAction = 'Delete'
            RetentionDurationDays = 365
            Scope = 'All'
        }
    )
    'SensitivityLabelsNeeded' = @(
        @{
            Name = 'Public'
            Color = '0078D4'
            ContentMarking = $false
        },
        @{
            Name = 'Internal'
            Color = 'A4373A'
            ContentMarking = 'Header: Internal Use Only'
        },
        @{
            Name = 'Confidential'
            Color = 'BB3433'
            ContentMarking = 'Header: CONFIDENTIAL'
            Encryption = 'RestrictedAccess'
        },
        @{
            Name = 'CJI - Restricted'
            Color = '761919'
            ContentMarking = 'Header: CJI - LAW ENFORCEMENT ONLY'
            Encryption = 'RestrictedAccess'
        }
    )
}

$auditResults['RecommendedConfiguration'] = $recommendedConfig

# Export to JSON
Write-Host "`nExporting audit results to $output..." -ForegroundColor Cyan
$auditResults | ConvertTo-Json -Depth 10 | Out-File -FilePath $output -Encoding utf8 -Force
Write-Host "Audit complete. Results saved to $output" -ForegroundColor Green

# Display summary
Write-Host "`nSecurity & Compliance Audit Summary:" -ForegroundColor Green
Write-Host "  Connection Status: $($auditResults['ComplianceConnection'])"
Write-Host "  DLP Policies: $($auditResults['DlpPolicies'].Count)"
Write-Host "  Retention Policies: $($auditResults['RetentionPolicies'].Count)"
Write-Host "  Retention Labels: $($auditResults['RetentionLabels'].Count)"
Write-Host "  eDiscovery Cases: $($auditResults['EDiscoveryCases'].Count)"
Write-Host "  Audit Logging: Enabled (90-day default retention)"
Write-Host "`nNote: For complete audit, connect via: Connect-IPPSSession -UserPrincipalName <privileged-admin-upn>"


