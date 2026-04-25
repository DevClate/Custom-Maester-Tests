BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsAllowDropBox.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5001", "Teams", "CustomTests", "Configuration", "Security" {
    It "TEAMS.TC.5001: Dropbox Integration - Dropbox integration should be disabled to prevent data exfiltration" {
        $result = Test-ContosoTeamsAllowDropBox
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "Third-party storage integration can lead to data exfiltration."
        }
    }
}
