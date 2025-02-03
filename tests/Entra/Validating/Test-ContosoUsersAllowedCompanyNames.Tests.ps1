BeforeAll {
    . "$PSScriptRoot/Test-ContosoUsersAllowedCompanyNames.ps1"
}

Describe "Contoso" -Tag "ENTRA.UV.1001", "Entra", "CustomTests", "Validation", "Users", "CompanyName" {
    It "ENTRA.UV.1001: Company Name - All users should have a valid company name" {
        $result = Test-ContosoUsersAllowedCompanyNames
        $result | Should -Be $true -Because "All users must have a company name from the valid list."
    }
}
