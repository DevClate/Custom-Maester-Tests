BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsChatDataProtection.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5016", "Teams", "CustomTests", "Configuration", "Security", "Chat", "DataProtection" {
    It "TEAMS.TC.5016: Chat settings should protect sensitive data" {
        $result = Test-ContosoTeamsChatDataProtection
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "Chat features may leak data to external services and should be configured based on data sensitivity."
        }
    }
}
