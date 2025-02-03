
BeforeAll {
    . "$PSScriptRoot\Test-ContosoUsersFormattingCapitalInitialEmail.ps1"
}

Describe "Contoso" -Tag "ENTRA.UF.1003.T01.Email", "Entra", "CustomTests", "Formatting", "Users" {
    It "ENTRA.UF.1003.T01.Email: Must be Capital First Initial and Last Name with First Letter Capitalized" {
        $result = Test-ContosoUsersFormattingCapitalInitialEmail
        $result | Should -Be $true -Because "All user emails must follow the capital-initial format."
    }
}