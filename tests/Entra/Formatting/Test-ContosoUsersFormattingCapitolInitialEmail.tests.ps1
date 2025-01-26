
BeforeAll {
    . "$PSScriptRoot\Test-ContosoUsersFormattingCapitolInitialEmail.ps1"
}

Describe "Contoso" -Tag "ENTRA.UF.1003.T01.Email", "Entra", "CustomTests", "Formatting", "Users" {
    It "ENTRA.UF.1003.T01.Email: Must be Capital First Initial and Last Name with First Letter Capitalized" {
        $result = Test-ContosoUsersFormattingCapitolInitialEmail
        $result | Should -Be $true -Because "All user emails must follow the capital-initial format."
    }
}