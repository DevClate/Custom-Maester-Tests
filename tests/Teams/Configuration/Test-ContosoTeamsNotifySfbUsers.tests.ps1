BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsNotifySfbUsers.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5036", "Teams", "CustomTests", "Configuration", "Informational", "Migration" {
    It "TEAMS.TC.5036: Review Skype for Business user notification settings" {
        $result = Test-ContosoTeamsNotifySfbUsers
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "This is an informational review of SfB to Teams upgrade notifications"
        }
    }
}
