BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsImmersiveReader.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5032", "Teams", "CustomTests", "Configuration", "Informational", "Accessibility" {
    It "TEAMS.TC.5032: Review Immersive Reader accessibility feature status" {
        $result = Test-ContosoTeamsImmersiveReader
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "This is an informational review of the Immersive Reader accessibility feature"
        }
    }
}
