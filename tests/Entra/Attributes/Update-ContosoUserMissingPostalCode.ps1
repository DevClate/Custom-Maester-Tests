
function Update-ContosoUserMissingPostalCode {
    [CmdletBinding(SupportsShouldProcess=$true)]
    param(
        [Parameter(Mandatory)]
        [string]$UserId,
        [Parameter(Mandatory)]
        [string]$PostalCode
    )
    try {
        if ($PSCmdlet.ShouldProcess("User: $UserId", "Set postal code to: $PostalCode")) {
            Update-MgUser -UserId $UserId -PostalCode $PostalCode
        }
    }
    catch {
        Write-Error $_.Exception.Message
        return $false
    }
    return $true
}