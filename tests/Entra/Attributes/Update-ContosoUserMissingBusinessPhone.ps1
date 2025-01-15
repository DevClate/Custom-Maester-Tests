
function Update-ContosoUserMissingBusinessPhone {
    [CmdletBinding(SupportsShouldProcess=$true)]
    param(
        [Parameter(Mandatory)]
        [string]$UserId,
        [Parameter(Mandatory)]
        [string]$BusinessPhones
    )
    try {
        if ($PSCmdlet.ShouldProcess("User: $UserId", "Set business phone to: $BusinessPhones")) {
            Update-MgUser -UserId $UserId -BusinessPhones @($BusinessPhones)
        }
    }
    catch {
        Write-Error $_.Exception.Message
        return $false
    }
    return $true
}