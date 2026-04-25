BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsGiphyContentRating.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5024", "Teams", "CustomTests", "Configuration", "Content" {
    It "TEAMS.TC.5024: Giphy content rating should be set to Strict if enabled" {
        $result = Test-ContosoTeamsGiphyContentRating
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "Giphy content should be restricted to prevent inappropriate content in the workplace."
        }
    }
}
