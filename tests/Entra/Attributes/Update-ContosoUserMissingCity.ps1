
function Update-ContosoUserMissingCity {
    [CmdletBinding(SupportsShouldProcess=$true)]
    param(
        [Parameter(Mandatory)]
        [string]$UserId,
        [Parameter(Mandatory)]
        [string]$City
    )
    try {
        if ($PSCmdlet.ShouldProcess("User: $UserId", "Set city to: $City")) {
            Update-MgUser -UserId $UserId -City $City
        }
    }
    catch {
        Write-Error $_.Exception.Message
        return $false
    }
    return $true
}