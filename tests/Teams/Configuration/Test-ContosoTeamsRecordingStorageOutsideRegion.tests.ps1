BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsRecordingStorageOutsideRegion.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5040", "Teams", "CustomTests", "Configuration", "Security", "Recording", "Compliance" {
    It "TEAMS.TC.5040: Recording storage outside region should be disabled for compliance" {
        $result = Test-ContosoTeamsRecordingStorageOutsideRegion
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "Meeting recordings should stay within the tenant's region for data residency compliance"
        }
    }
}
