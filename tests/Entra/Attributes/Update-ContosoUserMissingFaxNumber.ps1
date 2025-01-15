
function Update-ContosoUserMissingFaxNumber {
    [CmdletBinding(SupportsShouldProcess=$true)]
    param(
        [Parameter(Mandatory)]
        [string]$UserId,
        [Parameter(Mandatory)]
        [string]$FaxNumber
    )
    try {
        if ($PSCmdlet.ShouldProcess("User: $UserId", "Set fax number to: $FaxNumber")) {
            Update-MgUser -UserId $UserId -FaxNumber $FaxNumber
        }
    }
    catch {
        Write-Error $_.Exception.Message
        return $false
    }
    return $true
}