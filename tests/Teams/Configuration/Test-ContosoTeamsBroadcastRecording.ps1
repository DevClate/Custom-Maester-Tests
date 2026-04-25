function Test-ContosoTeamsBroadcastRecording {
    <#
    .SYNOPSIS
        Checks broadcast recording settings
    .DESCRIPTION
        TEAMS.TC.5015 - Review broadcast recording permissions
    #>
    $result = $true

    try {
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        $broadcastPolicy = Get-CsTeamsMeetingBroadcastPolicy | Where-Object { $_.Identity -eq "Global" }

        $recordingMode = if ($null -ne $broadcastPolicy.BroadcastRecordingMode) { 
            $broadcastPolicy.BroadcastRecordingMode.ToString() 
        } else { 
            "Not Set" 
        }

        $TestResults = "ℹ️ BroadcastRecordingMode is currently set to $recordingMode in the Global policy. Review this setting based on your organization's recording, compliance, and data retention requirements.`n`n"
        $TestResults += "**Description:** Broadcast recording settings determine who can record live events and how recordings are managed. Organizations should consider compliance requirements, data retention policies, storage costs, and privacy implications when configuring recording permissions."
        
        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
