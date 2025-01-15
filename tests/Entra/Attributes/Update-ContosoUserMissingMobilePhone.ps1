
function Update-ContosoUserMissingMobilePhone {
    [CmdletBinding(SupportsShouldProcess=$true)]
    param(
        [Parameter(Mandatory)]
        [string]$UserId,
        [Parameter(Mandatory)]
        [string]$MobilePhone
    )
    try {
        if ($PSCmdlet.ShouldProcess("User: $UserId", "Set mobile phone to: $MobilePhone")) {
            Update-MgUser -UserId $UserId -MobilePhone $MobilePhone
        }
    }
    catch {
        Write-Error $_.Exception.Message
        return $false
    }
    return $true
}