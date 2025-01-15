
function Update-ContosoUserMissingState {
    [CmdletBinding(SupportsShouldProcess=$true)]
    param(
        [Parameter(Mandatory)]
        [string]$UserId,
        [Parameter(Mandatory)]
        [string]$State
    )
    try {
        if ($PSCmdlet.ShouldProcess("User: $UserId", "Set state to: $State")) {
            Update-MgUser -UserId $UserId -State $State
        }
    }
    catch {
        Write-Error $_.Exception.Message
        return $false
    }
    return $true
}