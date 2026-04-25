BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsCallForwardingToPhone.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5012", "Teams", "CustomTests", "Configuration", "CallingPolicy", "Informational" {
    It "TEAMS.TC.5012: Call forwarding to phone should be reviewed" {
        $result = Test-ContosoTeamsCallForwardingToPhone
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "Call forwarding to PSTN can enable toll fraud."
        }
    }
}
