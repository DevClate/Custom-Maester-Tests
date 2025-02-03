
BeforeAll {
    . "$PSScriptRoot/Test-ContosoUsersAllowedStreetAddresses.ps1"
}

Describe "Contoso" -Tag "ENTRA.UV.1002", "Entra", "CustomTests", "Validation", "Users", "StreetAddress" {
    It "ENTRA.UV.1002: Street Addresses - All users should have a valid street address" {
        $result = Test-ContosoUsersAllowedStreetAddresses
        $result | Should -Be $true -Because "All users must have a street address from the valid list."
    }
}