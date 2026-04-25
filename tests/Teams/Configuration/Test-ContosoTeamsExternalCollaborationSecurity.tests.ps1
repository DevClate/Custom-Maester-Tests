BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsExternalCollaborationSecurity.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5020", "Teams", "CustomTests", "Configuration", "Security", "External" {
    It "TEAMS.TC.5020: External collaboration should be configured with security controls" {
        $result = Test-ContosoTeamsExternalCollaborationSecurity
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "External collaboration must be configured with appropriate security controls to prevent data leakage."
        }
    }
}
