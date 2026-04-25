BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsAnonymousStartMeeting.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5007", "Teams", "CustomTests", "Configuration", "Security" {
    It "TEAMS.TC.5007: Anonymous Start Meeting - Anonymous users should not be allowed to start meetings" {
        $result = Test-ContosoTeamsAnonymousStartMeeting
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "Anonymous users starting meetings poses security risks."
        }
    }
}
