BeforeAll {
    . $PSScriptRoot/Test-ContosoUsersMissingFaxNumber.ps1
}

Describe "Contoso" -Tag "ENTRA.UA.1013", "Entra", "CustomTests", "Users" {
    It "ENTRA.UA.1013: Fax Number Attribute - All users should have a fax number set" {
        $result = Test-ContosoUsersMissingFaxNumber
        $result | Should -Be $true -Because "All users should have a fax number assigned."
    }
}