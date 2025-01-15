BeforeAll {
    . $PSScriptRoot/Test-ContosoUsersMissingOfficeLocation.ps1
}

Describe "Contoso" -Tag "ENTRA.UA.1009", "Entra", "CustomTests", "Users" {
    It "ENTRA.UA.1009: Office Location Attribute - All users should have an office location set" {
        $result = Test-ContosoUsersMissingOfficeLocation
        $result | Should -Be $true -Because "All users should have an office location assigned."
    }
}