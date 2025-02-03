BeforeAll {
    . "$PSScriptRoot/Test-ContosoUsersAllowedCities.ps1"
}

Describe "Contoso" -Tag "ENTRA.UV.1003", "Entra", "CustomTests", "Validation", "Users", "City" {
    It "ENTRA.UV.1003: Cities - All users should have a valid city" {
        $result = Test-ContosoUsersAllowedCities
        $result | Should -Be $true -Because "All users must have a city from the valid list."
    }
}
