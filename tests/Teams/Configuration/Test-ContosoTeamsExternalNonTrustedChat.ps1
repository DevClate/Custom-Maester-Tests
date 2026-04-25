function Test-ContosoTeamsExternalNonTrustedChat {
    <#
    .SYNOPSIS
        Checks if external non-trusted meeting chat is allowed
    .DESCRIPTION
        TEAMS.TC.5021 - External non-trusted meeting chat should be disabled to prevent data exfiltration and phishing attacks
    #>
    $result = $true

    try {
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        $TeamsMeetingPolicy = Get-CsTeamsMeetingPolicy
        $TeamsMeetingPolicyGlobal = $TeamsMeetingPolicy | Where-Object { $_.Identity -eq "Global" }
        $portalLink_MeetingPolicy = "https://admin.teams.microsoft.com/policies/meetings"

        # Check if property exists (optional property)
        if ($null -eq $TeamsMeetingPolicyGlobal.PSObject.Properties['AllowExternalNonTrustedMeetingChat']) {
            $TestResults = "ℹ️ The AllowExternalNonTrustedMeetingChat property is not available in your tenant. This setting may not be available in all licensing tiers or tenant configurations."
            Add-MtTestResultDetail -Result $TestResults
            Set-ItResult -Skipped -Because "Property AllowExternalNonTrustedMeetingChat not available"
            return $null
        }

        $allowExternalNonTrustedChat = $TeamsMeetingPolicyGlobal.AllowExternalNonTrustedMeetingChat

        if ($allowExternalNonTrustedChat -eq $false) {
            $TestResults = "Well done! External non-trusted meeting chat is disabled."
        } else {
            $result = $false
            $TestResults = "❌ **Failed:** AllowExternalNonTrustedMeetingChat in [Meeting policies]($portalLink_MeetingPolicy) should be False but is currently **$($allowExternalNonTrustedChat)**."
        }

        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
