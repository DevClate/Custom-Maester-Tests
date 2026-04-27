BeforeAll {
    . $PSScriptRoot/Test-ContosoEntraLicenseUtilization.ps1
}

Describe "Contoso" -Tag "ENTRA.LC.3001", "Entra", "CustomTests", "Licensing", "Capacity" {
    It "ENTRA.LC.3001: License SKUs should not exceed 95% utilization threshold" {
        $result = Test-ContosoEntraLicenseUtilization
        
        if ($null -ne $result) {
            $result | Should -Be $true -Because "running out of licenses prevents user access to Microsoft 365 services and causes business disruption."
        }
    }
}
