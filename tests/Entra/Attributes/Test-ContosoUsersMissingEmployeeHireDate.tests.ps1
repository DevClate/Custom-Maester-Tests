BeforeAll {
    . $PSScriptRoot/Test-ContosoUsersMissingEmployeeHireDate.ps1
}

Describe "Contoso" -Tag "ENTRA.UA.1015", "Entra", "CustomTests", "Users" {
    It "ENTRA.UA.1015: Employee Hire Date Attribute - All users should have an employee hire date set" {
        $result = Test-ContosoUsersMissingEmployeeHireDate
        $result | Should -Be $true -Because "All users should have an employee hire date assigned."
    }
}