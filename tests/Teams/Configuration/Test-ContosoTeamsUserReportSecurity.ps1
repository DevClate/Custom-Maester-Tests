function Test-ContosoTeamsUserReportSecurity {
    <#
    .SYNOPSIS
        Checks if security end user reporting is enabled in Teams
    .DESCRIPTION
        TEAMS.TC.5031 - Users should be able to report security concerns directly from Teams.
        This test verifies that AllowSecurityEndUserReporting is set to TRUE.
    #>
    $result = $true

    try {
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        $messagingPolicy = Get-CsTeamsMessagingPolicy -Identity Global
        $allowReporting = $messagingPolicy.AllowSecurityEndUserReporting

        if ($allowReporting -eq $true) {
            $TestResults = "Well done! Security end user reporting is enabled in Teams."
        } else {
            $result = $false
            $TestResults = "Security end user reporting is disabled. Users should be able to report security concerns directly from Teams."
        }
        
        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
