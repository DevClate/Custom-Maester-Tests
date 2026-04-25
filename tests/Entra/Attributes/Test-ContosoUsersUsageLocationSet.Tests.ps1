BeforeAll {
    . $PSScriptRoot/Test-ContosoUsersUsageLocationSet.ps1
}

Describe "Entra ID User Configuration" -Tag "ENTRA.UA.1017", "Entra", "Users", "Licensing", "Maester" {
    It "ENTRA.UA.1017: All member users should have usageLocation configured" {
        $result = Test-ContosoUsersUsageLocationSet
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "usageLocation is required to assign licenses to users."
        }
    }
}
