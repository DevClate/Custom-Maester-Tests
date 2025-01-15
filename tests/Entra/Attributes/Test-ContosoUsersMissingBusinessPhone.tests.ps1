BeforeAll {
    . $PSScriptRoot/Test-ContosoUsersMissingBusinessPhone.ps1
}

Describe "Contoso" -Tag "ENTRA.UA.1012", "Entra", "CustomTests", "Users" {
    It "ENTRA.UA.1012: Business Phone Attribute - All users should have a business phone set" {
        $result = Test-ContosoUsersMissingBusinessPhone
        $result | Should -Be $true -Because "All users should have a business phone assigned."
    }
}