BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsExternalNonTrustedChat.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5021", "Teams", "CustomTests", "Configuration", "Security", "External" {
    It "TEAMS.TC.5021: External non-trusted meeting chat should be disabled" {
        $result = Test-ContosoTeamsExternalNonTrustedChat
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "External non-trusted meeting chat can lead to data exfiltration and phishing attacks."
        }
    }
}
