BeforeAll {
    . "$PSScriptRoot\Test-ContosoUsersAllowedStates.ps1"
}

Describe "Contoso" -Tag "ENTRA.UV.1004", "Entra", "CustomTests", "Validation", "Users", "State" {
    It "ENTRA.UV.1004: States - All users should have a valid state" {
        $result = Test-ContosoUsersAllowedStates
        $result | Should -Be $true -Because "All users must have a state from the valid list."
    }
}