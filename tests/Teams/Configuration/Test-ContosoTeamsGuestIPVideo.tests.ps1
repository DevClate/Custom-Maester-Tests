BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsGuestIPVideo.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5025", "Teams", "CustomTests", "Configuration", "Guest", "Informational" {
    It "TEAMS.TC.5025: Guest IP video settings should be reviewed" {
        $result = Test-ContosoTeamsGuestIPVideo
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "Guest IP video settings should be reviewed based on organizational requirements."
        }
    }
}
