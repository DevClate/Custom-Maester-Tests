BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsMeetNowAnonymous.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5034", "Teams", "CustomTests", "Configuration", "Security", "Anonymous" {
    It "TEAMS.TC.5034: Meet Now should be disabled to prevent unauthorized meetings" {
        $result = Test-ContosoTeamsMeetNowAnonymous
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "Meet Now allows unscheduled meetings that may bypass meeting controls"
        }
    }
}
