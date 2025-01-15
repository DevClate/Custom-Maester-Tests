
function Update-ContosoUserMissingEmployeeHireDate {
    [CmdletBinding(SupportsShouldProcess=$true)]
    param(
        [Parameter(Mandatory)]
        [string]$UserId,
        [Parameter(Mandatory)]
        [DateTime]$EmployeeHireDate
    )
    try {
        if ($PSCmdlet.ShouldProcess("User: $UserId", "Set hire date to: $EmployeeHireDate")) {
            Update-MgUser -UserId $UserId -EmployeeHireDate $EmployeeHireDate
        }
    }
    catch {
        Write-Error $_.Exception.Message
        return $false
    }
    return $true
}