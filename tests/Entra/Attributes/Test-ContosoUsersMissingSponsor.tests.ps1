BeforeAll {
    . $PSScriptRoot/Test-ContosoUsersMissingSponsor.ps1
}

Describe "Contoso" -Tag "ENTRA.UA.1014", "Entra", "CustomTests", "Users" {
    It "ENTRA.UA.1014: Sponsor Attribute - All users should have a sponsor set" {
        $result = Test-ContosoUsersMissingSponsor
        $result | Should -Be $true -Because "All users should have a sponsor assigned."
    }
}