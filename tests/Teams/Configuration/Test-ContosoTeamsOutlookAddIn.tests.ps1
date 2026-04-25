BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsOutlookAddIn.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5037", "Teams", "CustomTests", "Configuration", "Informational", "Integration" {
    It "TEAMS.TC.5037: Review Outlook add-in integration status" {
        $result = Test-ContosoTeamsOutlookAddIn
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "This is an informational review of the Teams meeting add-in for Outlook"
        }
    }
}
