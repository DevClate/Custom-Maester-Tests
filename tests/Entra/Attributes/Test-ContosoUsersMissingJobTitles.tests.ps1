BeforeAll {
    . $PSScriptRoot/Test-ContosoUsersMissingJobTitles.ps1
}

    
Describe "Contoso" -Tag "ENTRA.UA.1002", "Entra", "CustomTests", "Users" {    
    It "ENTRA.UA.1002: Job Title Attribute - All users should have a job title set" {
        $result = Test-ContosoUsersMissingJobTitles
        $result | Should -Be $true -Because "All users should have a job title assigned."
    }
}