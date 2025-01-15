BeforeAll {
    . $PSScriptRoot/Test-ContosoUsersMissingStreetAddress.ps1
}

Describe "Contoso" -Tag "ENTRA.UA.1003", "Entra", "CustomTests", "Users" {
    It "ENTRA.UA.1003: Street Address Attribute - All users should have a street address set" {
        $result = Test-ContosoUsersMissingStreetAddress
        $result | Should -Be $true -Because "All users should have a street address assigned."
    }
}