
function Update-ContosoUserMissingDepartment {
    [CmdletBinding(SupportsShouldProcess=$true)]
    param(
        [Parameter(Mandatory)]
        [string]$UserId,
        [Parameter(Mandatory)]
        [string]$Department
    )
    try {
        if ($PSCmdlet.ShouldProcess("User: $UserId", "Set department to: $Department")) {
            Update-MgUser -UserId $UserId -Department $Department
        }
    }
    catch {
        Write-Error $_.Exception.Message
        return $false
    }
    return $true
}