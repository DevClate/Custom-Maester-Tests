BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsAllowGoogleDrive.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5003", "Teams", "CustomTests", "Configuration", "Security" {
    It "TEAMS.TC.5003: Google Drive Integration - Google Drive integration should be disabled to prevent data exfiltration" {
        $result = Test-ContosoTeamsAllowGoogleDrive
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "Third-party storage integration can lead to data exfiltration."
        }
    }
}
