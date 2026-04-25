BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsGuestMeetingChat.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5026", "Teams", "CustomTests", "Configuration", "Guest", "Informational" {
    It "TEAMS.TC.5026: Guest meeting chat settings should be reviewed" {
        $result = Test-ContosoTeamsGuestMeetingChat
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "Guest meeting chat settings should be reviewed based on organizational requirements."
        }
    }
}
