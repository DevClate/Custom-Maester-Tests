BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsGuestScreenSharing.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5028", "Teams", "CustomTests", "Configuration", "Guest", "Security" {
    It "TEAMS.TC.5028: Guest screen sharing should be limited to prevent data leakage" {
        $result = Test-ContosoTeamsGuestScreenSharing
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "Guest screen sharing should be restricted to prevent unintended data exposure."
        }
    }
}
