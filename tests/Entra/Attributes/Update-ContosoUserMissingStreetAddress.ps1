
function Update-ContosoUserMissingStreetAddress {
    [CmdletBinding(SupportsShouldProcess=$true)]
    param(
        [Parameter(Mandatory)]
        [string]$UserId,
        [Parameter(Mandatory)]
        [string]$StreetAddress
    )
    try {
        if ($PSCmdlet.ShouldProcess("User: $UserId", "Set street address to: $StreetAddress")) {
            Update-MgUser -UserId $UserId -StreetAddress $StreetAddress
        }
    }
    catch {
        Write-Error $_.Exception.Message
        return $false
    }
    return $true
}