BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsBroadcastRecording.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5015", "Teams", "CustomTests", "Configuration", "BroadcastPolicy", "Informational" {
    It "TEAMS.TC.5015: Broadcast recording settings should be reviewed" {
        $result = Test-ContosoTeamsBroadcastRecording
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "Broadcast recording should align with organizational requirements."
        }
    }
}
