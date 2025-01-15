BeforeAll {
    . $PSScriptRoot/Test-ContosoUsersMissingCity.ps1
}


Describe "Contoso" -Tag "ENTRA.UA.1004", "Entra", "CustomTests", "Users" {
    It "ENTRA.UA.1004: City Attribute - All users should have a city set" {
        $result = Test-ContosoUsersMissingCity
        $result | Should -Be $true -Because "All users should have a city assigned."
    }
}