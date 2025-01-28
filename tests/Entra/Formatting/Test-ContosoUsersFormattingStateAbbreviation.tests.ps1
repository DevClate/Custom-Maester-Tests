BeforeAll {
    . "$PSScriptRoot/Test-ContosoUsersFormattingStateAbbreviation.ps1"
}

Describe "Contoso" -Tag "ENTRA.UF.1004.T01.USState", "Entra", "CustomTests", "Formatting" {
    It "ENTRA.UF.1004.T01.USState: Two-letter state abbreviation with no periods" {
        $result = Test-ContosoUsersFormattingStateAbbreviation
        $result | Should -Be $true -Because "All users must have state in two-letter format with no periods (e.g. CA)."
    }
}