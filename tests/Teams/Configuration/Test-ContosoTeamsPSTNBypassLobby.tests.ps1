BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsPSTNBypassLobby.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5039", "Teams", "CustomTests", "Configuration", "Security", "Lobby" {
    It "TEAMS.TC.5039: PSTN users should not bypass the lobby" {
        $result = Test-ContosoTeamsPSTNBypassLobby
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "PSTN callers should be authenticated through the lobby for security"
        }
    }
}
