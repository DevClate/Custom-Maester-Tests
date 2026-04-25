BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsAllowEmailIntoChannel.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5005", "Teams", "CustomTests", "Configuration", "Security" {
    It "TEAMS.TC.5005: Email into Channel - Email into channel should be disabled to prevent bypassing email security controls" {
        $result = Test-ContosoTeamsAllowEmailIntoChannel
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "Email into channel can bypass email security controls."
        }
    }
}
