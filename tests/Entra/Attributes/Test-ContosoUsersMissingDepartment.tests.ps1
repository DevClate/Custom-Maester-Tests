BeforeAll {
    . $PSScriptRoot/Test-ContosoUsersMissingDepartment.ps1
}

Describe "Contoso" -Tag "ENTRA.UA.1008", "Entra", "CustomTests", "Users" {
    It "ENTRA.UA.1008: Department Attribute - All users should have a department set" {
        $result = Test-ContosoUsersMissingDepartment
        $result | Should -Be $true -Because "All users should have a department assigned."
    }
}