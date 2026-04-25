function Test-ContosoTeamsPSTNBypassLobby {
    <#
    .SYNOPSIS
        Checks if PSTN users are required to go through the lobby
    .DESCRIPTION
        TEAMS.TC.5039 - PSTN callers should be authenticated through the lobby for security.
        This test verifies that AllowPSTNUsersToBypassLobby is set to FALSE.
    #>
    $result = $true

    try {
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        $meetingPolicy = Get-CsTeamsMeetingPolicy -Identity Global
        $bypassLobby = $meetingPolicy.AllowPSTNUsersToBypassLobby

        # Handle null value (may not be set)
        if ($null -eq $bypassLobby -or $bypassLobby -eq $false) {
            $TestResults = "Well done! PSTN users are required to go through the lobby for authentication."
        } else {
            $result = $false
            $TestResults = "PSTN users can bypass the lobby. This allows unauthenticated phone callers to join meetings directly."
        }
        
        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
