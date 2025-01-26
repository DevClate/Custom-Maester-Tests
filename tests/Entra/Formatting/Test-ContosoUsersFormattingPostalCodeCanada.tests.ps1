
# Example: Tests for Contoso using Pester

BeforeAll {
    . "$PSScriptRoot\Test-ContosoUsersFormattingPostalCodeCanada.ps1"
}

Describe "Contoso" -Tag "ENTRA.UF.1001.T01.Canada", "Entra", "CustomTests", "Canada", "Users", "Formatting" {

    It "ENTRA.UF.1001.T01.Canada: Postal Code - All users should have a valid Canadian postal code" {
        $result = Test-ContosoUsersFormattingPostalCodeCanada
        $result | Should -Be $true -Because "All users must have a valid Canadian postal code."
    }

}