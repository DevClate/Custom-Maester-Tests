BeforeAll {
    . "$PSScriptRoot/Test-ContosoUsersAllowedTitles.ps1"
}

Describe "Contoso" -Tag "ENTRA.UV.1008", "Entra", "CustomTests", "Validation", "Users", "Title" {
    It "ENTRA.UV.1008: Title - All users should have a valid title" {
        $result = Test-ContosoUsersAllowedTitles
        $result | Should -Be $true -Because "All users must have a title from the valid list."
    }
}
