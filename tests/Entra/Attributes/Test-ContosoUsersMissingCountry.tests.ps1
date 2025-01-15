BeforeAll {
    . $PSScriptRoot/Test-ContosoUsersMissingCountry.ps1
}

Describe "Contoso" -Tag "ENTRA.UA.1007", "Entra", "CustomTests", "Users" {
    It "ENTRA.UA.1007: Country Attribute - All users should have a country set" {
        $result = Test-ContosoUsersMissingCountry
        $result | Should -Be $true -Because "All users should have a country assigned."
    }
}