BeforeAll {
    . "$PSScriptRoot/Test-ContosoUsersAllowedBusinessNumbers.ps1"
}

Describe "Contoso" -Tag "ENTRA.UV.1007", "Entra", "CustomTests", "Validation", "Users", "BusinessNumber" {
    It "ENTRA.UV.1007: Business Number - All users should have an allowed business number" {
        $result = Test-ContosoUsersAllowedBusinessNumbers
        $result | Should -Be $true -Because "All users must have a business number from the valid list."
    }
}
