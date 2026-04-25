BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsAllowShareFile.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5004", "Teams", "CustomTests", "Configuration", "Security" {
    It "TEAMS.TC.5004: Citrix ShareFile Integration - Citrix ShareFile integration should be disabled to prevent data exfiltration" {
        $result = Test-ContosoTeamsAllowShareFile
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "Third-party storage integration can lead to data exfiltration."
        }
    }
}
