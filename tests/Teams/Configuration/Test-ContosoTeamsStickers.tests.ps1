BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsStickers.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5044", "Teams", "CustomTests", "Configuration", "Security", "Content" {
    It "TEAMS.TC.5044: Stickers should be disabled to prevent inappropriate content" {
        $result = Test-ContosoTeamsStickers
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "Stickers can contain inappropriate content in professional environments"
        }
    }
}
