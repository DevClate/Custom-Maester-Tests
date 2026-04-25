BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsScopedPeopleSearch.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5042", "Teams", "CustomTests", "Configuration", "Informational", "Search", "Privacy" {
    It "TEAMS.TC.5042: Review scoped people search settings" {
        $result = Test-ContosoTeamsScopedPeopleSearch
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "This is an informational review of directory search scope for privacy considerations"
        }
    }
}
