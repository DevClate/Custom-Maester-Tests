BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsGuestMeetNow.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5027", "Teams", "CustomTests", "Configuration", "Guest", "Security" {
    It "TEAMS.TC.5027: Guests should not be able to start ad-hoc meetings" {
        $result = Test-ContosoTeamsGuestMeetNow
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "Guests should not be able to initiate meetings to maintain control over meeting creation."
        }
    }
}
