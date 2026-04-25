function Test-ContosoTeamsExternalCollaborationSecurity {
    <#
    .SYNOPSIS
        Checks external collaboration security settings for Teams
    .DESCRIPTION
        TEAMS.TC.5020 - Reviews external collaboration settings including federation, guests, and public users
    #>
    $result = $true
    $warnings = @()
    $recommendations = @()

    try {
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        # Get Teams configuration
        $clientConfig = Get-CsTeamsClientConfiguration
        $federationConfig = Get-CsTenantFederationConfiguration
        $meetingPolicy = Get-CsTeamsMeetingPolicy -Identity Global

        $portalLink = "https://admin.teams.microsoft.com/company-wide-settings/external-communications"

        # Check 1: Public users (Skype for Business and Skype consumer)
        if ($clientConfig.AllowPublicUsers -eq $true) {
            $warnings += "⚠️ **AllowPublicUsers** is enabled - allows communication with Skype users"
            $recommendations += "Consider disabling public users (Skype) if not needed for business requirements"
        }

        # Check 2: Federation configuration
        if ($federationConfig.AllowFederatedUsers -eq $true) {
            if ($federationConfig.AllowedDomains.Count -eq 0 -and $federationConfig.BlockedDomains.Count -eq 0) {
                $warnings += "⚠️ **Federation** is open to all domains - consider using an allowed list"
                $recommendations += "Configure specific allowed domains instead of open federation"
                $result = $false
            } else {
                # Federation is configured with domain restrictions - good
            }
        }

        # Check 3: Guest meeting capabilities
        if ($meetingPolicy.AllowPSTNUsersToBypassLobby -eq $true) {
            $warnings += "⚠️ **AllowPSTNUsersToBypassLobby** is enabled - phone users skip lobby"
            $recommendations += "Consider requiring lobby for PSTN users for better security"
        }

        # Build result markdown
        if ($result -and $warnings.Count -eq 0) {
            $TestResults = "Well done! External collaboration is configured with appropriate security controls."
        } else {
            $TestResults = "⚠️ **External Collaboration Security Review**`n`n"
            
            if ($warnings.Count -gt 0) {
                $TestResults += "**Findings:**`n`n"
                foreach ($warning in $warnings) {
                    $TestResults += "$warning`n"
                }
                $TestResults += "`n"
            }
            
            if ($recommendations.Count -gt 0) {
                $TestResults += "**Recommendations:**`n`n"
                foreach ($recommendation in $recommendations) {
                    $TestResults += "- $recommendation`n"
                }
            }
        }

        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
