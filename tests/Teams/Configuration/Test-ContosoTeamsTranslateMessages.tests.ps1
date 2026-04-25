BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsTranslateMessages.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5045", "Teams", "CustomTests", "Configuration", "Security", "Privacy", "Translation" {
    It "TEAMS.TC.5045: Review message translation for sensitive data concerns" {
        $result = Test-ContosoTeamsTranslateMessages
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "Message translation may expose sensitive data to external services"
        }
    }
}
