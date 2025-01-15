BeforeAll {
    . $PSScriptRoot/Test-ContosoUsersMissingManagers.ps1
}

Describe "Contoso" -Tag "ENTRA.UA.1001", "Entra", "CustomTests", "Users" {
    It "ENTRA.UA.1001: Manager Attribute - All users should have a manager attribute set" {
        $result = Test-ContosoUsersMissingManagers
        $result | Should -Be $true -Because "All users should have a manager assigned."
    }
}