BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsPrivateMeetingScheduling.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5038", "Teams", "CustomTests", "Configuration", "Informational", "Meetings" {
    It "TEAMS.TC.5038: Review private meeting scheduling status" {
        $result = Test-ContosoTeamsPrivateMeetingScheduling
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "This is an informational review of private meeting scheduling capabilities"
        }
    }
}
