BeforeAll {
    . "$PSScriptRoot/Test-ContosoUsersFormattingFirstLastLowerCase.ps1"
}

Describe "Contoso" -Tag "ENTRA.UF.1003.T03.Email", "Entra", "CustomTests", "Formatting", "FirstLastEmail", "Users" {
    It "ENTRA.UF.1003.T03.Email: All user emails must be in firstname.lastname format with all lowercase" {
        $result = Test-ContosoUsersFormattingFirstLastLowerCase
        $result | Should -Be $true -Because "User emails must follow the firstname.lastname format."
    }
}
