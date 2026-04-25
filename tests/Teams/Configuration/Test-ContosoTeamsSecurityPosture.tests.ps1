BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsSecurityPosture.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5043", "Teams", "CustomTests", "Configuration", "Security", "Comprehensive" {
    It "TEAMS.TC.5043: Review overall Teams security posture" {
        $result = Test-ContosoTeamsSecurityPosture
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "This is a comprehensive security review of Teams configuration across multiple policies"
        }
    }
}
