BeforeAll {
    . $PSScriptRoot/Test-ContosoUsersMissingPostalCode.ps1

}

Describe "Contoso" -Tag "ENTRA.UA.1006", "Entra", "CustomTests", "Users" {
    It "ENTRA.UA.1006: Postal Code Attribute - All users should have a postal code set" {
        $result = Test-ContosoUsersMissingPostalCode
        $result | Should -Be $true -Because "All users should have a postal code assigned."
    }
}
