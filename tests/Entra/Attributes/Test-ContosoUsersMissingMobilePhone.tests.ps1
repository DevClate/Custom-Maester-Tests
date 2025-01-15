BeforeAll {
    . $PSScriptRoot/Test-ContosoUsersMissingMobilePhone.ps1
}

Describe "Contoso" -Tag "ENTRA.UA.1011", "Entra", "CustomTests", "Users" {
    It "ENTRA.UA.1011: Mobile Phone Attribute - All users should have a mobile phone set" {
        $result = Test-ContosoUsersMissingMobilePhone
        $result | Should -Be $true -Because "All users should have a mobile phone assigned."
    }
}