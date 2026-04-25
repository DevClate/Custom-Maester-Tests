function Test-ContosoTeamsBroadcastTranscription {
    <#
    .SYNOPSIS
        Checks broadcast transcription settings
    .DESCRIPTION
        TEAMS.TC.5011 - Review broadcast transcription settings
    #>
    $result = $true

    try {
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        $broadcastPolicy = Get-CsTeamsMeetingBroadcastPolicy | Where-Object { $_.Identity -eq "Global" }

        $allowBroadcastTranscription = if ($null -ne $broadcastPolicy.AllowBroadcastTranscription) { 
            $broadcastPolicy.AllowBroadcastTranscription.ToString() 
        } else { 
            "Not Set" 
        }

        $TestResults = "ℹ️ AllowBroadcastTranscription is currently set to $allowBroadcastTranscription in the Global policy. Review this setting based on your organization's accessibility and compliance requirements. Broadcast transcription can improve accessibility for attendees but may have implications for data storage, compliance, and privacy. Organizations should review this setting based on their specific requirements."

        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
