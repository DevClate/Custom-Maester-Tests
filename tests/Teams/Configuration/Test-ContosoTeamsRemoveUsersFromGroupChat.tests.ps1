BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsRemoveUsersFromGroupChat.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5041", "Teams", "CustomTests", "Configuration", "Informational", "Governance" {
    It "TEAMS.TC.5041: Review chat owner message deletion permissions" {
        $result = Test-ContosoTeamsRemoveUsersFromGroupChat
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "This is an informational review of chat governance capabilities"
        }
    }
}
