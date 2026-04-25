BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsFederatedDomains.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5023", "Teams", "CustomTests", "Configuration", "Security", "External" {
    It "TEAMS.TC.5023: Federation should be restricted to specific allowed domains" {
        $result = Test-ContosoTeamsFederatedDomains
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "Open federation to all domains increases security risks and should be restricted to specific trusted domains."
        }
    }
}
