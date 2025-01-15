BeforeAll {
    . $PSScriptRoot/Test-ContosoUsersMissingCompanyName.ps1
}

Describe "Contoso" -Tag "ENTRA.UA.1010", "Entra", "CustomTests", "Users" {
    It "ENTRA.UA.1010: Company Name Attribute - All users should have a company name set" {
        $result = Test-ContosoUsersMissingCompanyName
        $result | Should -Be $true -Because "All users should have a company name assigned."
    }
}
