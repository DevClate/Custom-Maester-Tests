BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsAllowEgnyte.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5005", "Teams", "CustomTests", "Configuration", "ThirdPartyStorage" {
    It "TEAMS.TC.5005: Egnyte integration should be disabled" {
        $result = Test-ContosoTeamsAllowEgnyte
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "Egnyte integration can lead to data exfiltration and should be disabled."
        }
    }
}
