BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsMeetingRecordingSecurity.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5033", "Teams", "CustomTests", "Configuration", "Security", "Recording" {
    It "TEAMS.TC.5033: Review meeting recording security settings" {
        $result = Test-ContosoTeamsMeetingRecordingSecurity
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "This is a security review of meeting recording, transcription, and storage settings"
        }
    }
}
