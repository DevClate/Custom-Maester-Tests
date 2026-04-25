BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsChatPermissionRole.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5018", "Teams", "CustomTests", "Configuration", "MessagingPolicy", "Informational" {
    It "TEAMS.TC.5018: Chat permission roles should be reviewed" {
        $result = Test-ContosoTeamsChatPermissionRole
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "Chat permissions should align with collaboration requirements."
        }
    }
}
