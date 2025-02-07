BeforeAll {
    . "$PSScriptRoot/Test-ContosoUsersAllowedLocations.ps1"
}

Describe "Contoso" -Tag "ENTRA.UV.1010.L01", "Entra", "CustomTests", "Validation", "Users", "Location" {
    It "ENTRA.UV.1010.L01: Locations - All users must have all 7 location properties correct" {
        $result = Test-ContosoUsersAllowedLocations
        $result | Should -Be $true -Because "All users must have streetAddress, city, state, and postalCode, country, businessPhones, and companyName matching exactly within the same allowed record."
    }
}
