
BeforeAll {
    . "$PSScriptRoot\Test-ContosoUsersFormattingLowerCaseInitialEmail.ps1"
}

Describe "Contoso" -Tag "ENTRA.UF.1003.T02.Email", "LowerCaseEmail" {
    It "ENTRA.UF.1003.T02.Email: All user emails must be lowercase first initial + last name" {
        $result = Test-ContosoUsersFormattingLowerCaseInitialEmail
        $result | Should -Be $true -Because "User emails must follow the lowercase initial + last name format."
    }
}