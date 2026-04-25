BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsUserReportSecurity.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5031", "Teams", "CustomTests", "Configuration", "Security", "Reporting" {
    It "TEAMS.TC.5031: Security end user reporting should be enabled" {
        $result = Test-ContosoTeamsUserReportSecurity
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "Users should be able to report security concerns directly from Teams"
        }
    }
}
