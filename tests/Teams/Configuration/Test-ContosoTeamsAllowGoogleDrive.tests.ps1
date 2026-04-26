BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsAllowGoogleDrive.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5003", "Teams", "CustomTests", "Configuration", "ThirdPartyStorage" {
    It "TEAMS.TC.5003: Google Drive integration should be disabled" {
        $result = Test-ContosoTeamsAllowGoogleDrive
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "Google Drive integration can lead to data exfiltration and should be disabled."
        }
    }
}
