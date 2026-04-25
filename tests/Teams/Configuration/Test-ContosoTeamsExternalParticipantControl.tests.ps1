BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsExternalParticipantControl.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5022", "Teams", "CustomTests", "Configuration", "Security", "External" {
    It "TEAMS.TC.5022: External participants should not be allowed to give or request control" {
        $result = Test-ContosoTeamsExternalParticipantControl
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "External participants should not be able to control shared screens to prevent security risks."
        }
    }
}
