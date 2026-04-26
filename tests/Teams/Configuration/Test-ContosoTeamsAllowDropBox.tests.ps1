BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsAllowDropBox.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5001", "Teams", "CustomTests", "Configuration", "ThirdPartyStorage" {
    It "TEAMS.TC.5001: Dropbox integration should be disabled" {
        $result = Test-ContosoTeamsAllowDropBox
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "Dropbox integration can lead to data exfiltration and should be disabled."
        }
    }
}
