BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsAllowBox.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5002", "Teams", "CustomTests", "Configuration", "ThirdPartyStorage" {
    It "TEAMS.TC.5002: Box integration should be disabled" {
        $result = Test-ContosoTeamsAllowBox
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "Box integration can lead to data exfiltration and should be disabled."
        }
    }
}
