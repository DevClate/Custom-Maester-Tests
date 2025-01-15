BeforeAll {
    . $PSScriptRoot/Test-ContosoUsersMissingEmployeeID.ps1
}

Describe "Contoso" -Tag "ENTRA.UA.1016", "Entra", "CustomTests", "Users" {
    It "ENTRA.UA.1016: Employee ID Attribute - All users should have an employee ID set" {
        $result = Test-ContosoUsersMissingEmployeeID
        $result | Should -Be $true -Because "All users should have an employee ID assigned."
    }
}