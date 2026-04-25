function Test-ContosoTeamsMeetingRecordingSecurity {
    <#
    .SYNOPSIS
        Reviews Teams meeting recording security settings
    .DESCRIPTION
        TEAMS.TC.5033 - Security review of meeting recording settings including
        storage location, cloud recording, and transcription capabilities.
    #>
    $result = $true

    try {
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        $meetingPolicy = Get-CsTeamsMeetingPolicy -Identity Global
        $storageOutsideRegion = $meetingPolicy.AllowRecordingStorageOutsideRegion
        $cloudRecording = $meetingPolicy.AllowCloudRecording
        $transcription = $meetingPolicy.AllowTranscription

        $TestResults = "Meeting Recording Security Review:`n"
        $TestResults += "- Cloud Recording: $cloudRecording`n"
        $TestResults += "- Transcription: $transcription`n"
        $TestResults += "- Storage Outside Region: $storageOutsideRegion`n"
        $TestResults += "`nReview these settings to ensure they align with your security and compliance requirements."
        
        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
