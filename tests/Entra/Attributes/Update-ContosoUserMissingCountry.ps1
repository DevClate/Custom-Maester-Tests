
function Update-ContosoUserMissingCountry {
    [CmdletBinding(SupportsShouldProcess=$true)]
    param(
        [Parameter(Mandatory)]
        [string]$UserId,
        [Parameter(Mandatory)]
        [string]$Country
    )
    try {
        if ($PSCmdlet.ShouldProcess("User: $UserId", "Set country to: $Country")) {
            Update-MgUser -UserId $UserId -Country $Country
        }
    }
    catch {
        Write-Error $_.Exception.Message
        return $false
    }
    return $true
}