BeforeAll {
    . $PSScriptRoot/Test-ContosoTeamsAnonymousDialOut.ps1
}

Describe "Contoso" -Tag "TEAMS.TC.5008", "Teams", "CustomTests", "Configuration", "Security" {
    It "TEAMS.TC.5008: Anonymous Dial Out - Anonymous users should not be allowed to dial out to prevent toll fraud" {
        $result = Test-ContosoTeamsAnonymousDialOut
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "Anonymous dial out can lead to toll fraud and unauthorized PSTN usage."
        }
    }
}
