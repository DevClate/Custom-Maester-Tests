BeforeAll {
    . "$PSScriptRoot/Test-ContosoUsersAllowedDepartments.ps1"
}

Describe "Contoso" -Tag "ENTRA.UV.1009", "Entra", "CustomTests", "Validation", "Users", "Department" {
    It "ENTRA.UV.1009: Department - All users should have a valid department" {
        $result = Test-ContosoUsersAllowedDepartments
        $result | Should -Be $true -Because "All users must have a department from the valid list."
    }
}
