BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsUrlPreviews.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5030", "Teams", "CustomTests", "Configuration", "Security", "Content" {
    It "TEAMS.TC.5030: URL previews should be disabled to prevent information leakage" {
        $result = Test-ContosoTeamsUrlPreviews
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "URL previews can leak information to external sites when links are shared"
        }
    }
}
