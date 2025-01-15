BeforeAll {
    . $PSScriptRoot/Test-ContosoUsersMissingState.ps1
}

Describe "Contoso" -Tag "ENTRA.UA.1005", "Entra", "CustomTests", "Users" {
    It "ENTRA.UA.1005: State Attribute - All users should have a state set" {
        $result = Test-ContosoUsersMissingState
        $result | Should -Be $true -Because "All users should have a state assigned."
    }
}