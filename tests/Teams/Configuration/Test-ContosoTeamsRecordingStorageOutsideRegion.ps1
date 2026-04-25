function Test-ContosoTeamsRecordingStorageOutsideRegion {
    <#
    .SYNOPSIS
        Checks if recording storage outside region is disabled for compliance
    .DESCRIPTION
        TEAMS.TC.5040 - Meeting recordings should stay within the tenant's region
        for data residency compliance. This test verifies that
        AllowRecordingStorageOutsideRegion is set to FALSE.
    #>
    $result = $true

    try {
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        $meetingPolicy = Get-CsTeamsMeetingPolicy -Identity Global
        $cloudRecording = $meetingPolicy.AllowCloudRecording
        
        # Skip test if cloud recording is disabled
        if ($cloudRecording -eq $false) {
            $TestResults = "Cloud recording is disabled. Storage location check is not applicable."
            Add-MtTestResultDetail -Result $TestResults
            return $result
        }

        $storageOutsideRegion = $meetingPolicy.AllowRecordingStorageOutsideRegion

        if ($storageOutsideRegion -eq $false) {
            $TestResults = "Well done! Meeting recordings are restricted to your tenant's region for compliance."
        } else {
            $result = $false
            $TestResults = "Recording storage outside region is enabled. This may violate data residency requirements."
        }
        
        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
