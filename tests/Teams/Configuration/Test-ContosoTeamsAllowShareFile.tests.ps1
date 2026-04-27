BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsAllowShareFile.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5004", "Teams", "CustomTests", "Configuration", "ThirdPartyStorage" {
    It "TEAMS.TC.5004: Citrix files integration should be disabled" {
        $result = Test-ContosoTeamsAllowShareFile
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "Citrix files integration can lead to data exfiltration and should be disabled."
        }
    }
}
