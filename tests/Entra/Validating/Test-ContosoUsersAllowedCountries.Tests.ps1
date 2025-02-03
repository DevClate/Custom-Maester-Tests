BeforeAll {
    . "$PSScriptRoot/Test-ContosoUsersAllowedCountries.ps1"
}

Describe "Contoso" -Tag "ENTRA.UV.1006", "Entra", "CustomTests", "Validation", "Users", "Country" {
    It "ENTRA.UV.1006: Countries - All users should have a valid country" {
        $result = Test-ContosoUsersAllowedCountries
        $result | Should -Be $true -Because "All users must have a country from the allowed list."
    }
}
