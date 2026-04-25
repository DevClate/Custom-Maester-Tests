BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsAnonymousJoinMeeting.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5006", "Teams", "CustomTests", "Configuration", "Security" {
    It "TEAMS.TC.5006: Anonymous Join Meeting - Anonymous users should not be allowed to join meetings" {
        $result = Test-ContosoTeamsAnonymousJoinMeeting
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "Restricting anonymous join reduces exposure to uninvited attendees."
        }
    }
}
