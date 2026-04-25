BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsMemes.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5035", "Teams", "CustomTests", "Configuration", "Security", "Content" {
    It "TEAMS.TC.5035: Memes should be disabled to prevent inappropriate content" {
        $result = Test-ContosoTeamsMemes
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "Memes can contain inappropriate content in professional environments"
        }
    }
}
