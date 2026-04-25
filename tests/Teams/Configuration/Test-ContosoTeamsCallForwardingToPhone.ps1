function Test-ContosoTeamsCallForwardingToPhone {
    <#
    .SYNOPSIS
        Checks call forwarding to phone settings
    .DESCRIPTION
        TEAMS.TC.5012 - Call forwarding to PSTN can enable toll fraud
    #>
    $result = $true

    try {
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        $callingPolicy = Get-CsTeamsCallingPolicy | Where-Object { $_.Identity -eq "Global" }
        $portalLink = "https://admin.teams.microsoft.com/policies/calling"

        $allowCallForwardingToPhone = $callingPolicy.AllowCallForwardingToPhone

        $TestResults = "ℹ️ AllowCallForwardingToPhone in [Calling policies]($portalLink) is currently set to **$($allowCallForwardingToPhone)** in the Global policy. Review this setting as it can potentially enable toll fraud if misused. Call forwarding to external phone numbers (PSTN) can be exploited for toll fraud, where attackers forward calls to premium-rate numbers, resulting in significant charges. Organizations should carefully review this setting and consider disabling it or implementing strict monitoring and controls."

        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
