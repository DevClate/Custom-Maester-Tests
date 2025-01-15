# Example: Tests for Contoso using Pester

BeforeAll {
    . "$PSScriptRoot\Test-ContosoUsersFormattingPostalCodeUSA.ps1"
}

Describe "Contoso" -Tag "ENTRA.UF.1001.USA", "Entra", "CustomTests", "USA", "Users", "Formatting" {

    It "ENTRA.UF.1001.USA: Postal Code - All users should have a valid US postal code" {
        $result = Test-ContosoUsersFormattingPostalCodeUSA
        $result | Should -Be $true -Because "All users must have a valid US postal code."
    }

}
