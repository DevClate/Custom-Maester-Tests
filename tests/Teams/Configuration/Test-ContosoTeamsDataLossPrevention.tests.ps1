BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsDataLossPrevention.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5013", "Teams", "CustomTests", "Configuration", "Security", "DLP", "DataProtection" {
    It "TEAMS.TC.5013: DLP policies should be configured for Teams (Informational)" {
        $result = Test-ContosoTeamsDataLossPrevention
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "DLP policies protect sensitive data in Teams conversations and files."
        }
    }
}
