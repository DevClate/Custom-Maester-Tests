
function Update-ContosoUserMissingEmployeeID {
    [CmdletBinding(SupportsShouldProcess=$true)]
    param(
        [Parameter(Mandatory)]
        [string]$UserId,
        [Parameter(Mandatory)]
        [string]$EmployeeID
    )
    try {
        if ($PSCmdlet.ShouldProcess("User: $UserId", "Set Employee ID to: $EmployeeID")) {
            Update-MgUser -UserId $UserId -EmployeeId $EmployeeID
        }
    }
    catch {
        Write-Error $_.Exception.Message
        return $false
    }
    return $true
}