BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsGuestTranscription.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5029", "Teams", "CustomTests", "Configuration", "Guest", "Security" {
    It "TEAMS.TC.5029: Guests should not control transcription" {
        $result = Test-ContosoTeamsGuestTranscription
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "Guests should not be able to control transcription to prevent unauthorized data capture."
        }
    }
}
