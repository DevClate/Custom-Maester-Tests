BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsAutoAdmittedUsers.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5011", "Teams", "CustomTests", "Configuration", "Security" {
    It "TEAMS.TC.5011: Auto Admitted Users - Auto-admitted users should be restricted to prevent unauthorized access" {
        $result = Test-ContosoTeamsAutoAdmittedUsers
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "Unrestricted auto-admission can allow unauthorized meeting access."
        }
    }
}
