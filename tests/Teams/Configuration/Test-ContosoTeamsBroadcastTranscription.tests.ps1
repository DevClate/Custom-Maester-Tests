BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsBroadcastTranscription.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5011", "Teams", "CustomTests", "Configuration", "BroadcastPolicy", "Informational" {
    It "TEAMS.TC.5011: Broadcast transcription settings should be reviewed" {
        $result = Test-ContosoTeamsBroadcastTranscription
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "Broadcast transcription should align with organizational requirements."
        }
    }
}
