BeforeAll {
    . "$PSScriptRoot/Test-ContosoUsersAllowedLocationsNoBusinessPhones.ps1"
}

Describe "Contoso" -Tag "ENTRA.UV.1010.L02", "Entra", "CustomTests", "Validation", "Users", "Location" {
    It "ENTRA.UV.1010.L02: Locations - All users must have 6 location properties correct" {
        $result = Test-ContosoUsersAllowedLocationsNoBusinessPhones
        $result | Should -Be $true -Because "All users must have streetAddress, city, state, postalCode, country, and companyName matching exactly within the allowed record."
    }
}
