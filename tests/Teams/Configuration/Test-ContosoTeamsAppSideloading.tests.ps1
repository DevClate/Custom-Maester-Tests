BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsAppSideloading.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5009", "Teams", "CustomTests", "Configuration", "Security" {
    It "TEAMS.TC.5009: App Sideloading - App sideloading should be disabled to enforce security review" {
        $result = Test-ContosoTeamsAppSideloading
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "Sideloading apps bypasses security review."
        }
    }
}
