BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsBroadcastAttendeeVisibility.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5017", "Teams", "CustomTests", "Configuration", "BroadcastPolicy", "Security" {
    It "TEAMS.TC.5017: Broadcast attendee visibility should protect privacy" {
        $result = Test-ContosoTeamsBroadcastAttendeeVisibility
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "Attendee visibility should be restricted to protect privacy."
        }
    }
}
