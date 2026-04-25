BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsChannelMeetingScheduling.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5014", "Teams", "CustomTests", "Configuration", "MeetingPolicy", "Informational" {
    It "TEAMS.TC.5014: Channel meeting scheduling should be controlled" {
        $result = Test-ContosoTeamsChannelMeetingScheduling
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "Channel meeting scheduling should be controlled to ensure proper governance."
        }
    }
}
