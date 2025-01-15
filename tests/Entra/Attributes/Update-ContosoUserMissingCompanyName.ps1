
function Update-ContosoUserMissingCompanyName {
    [CmdletBinding(SupportsShouldProcess=$true)]
    param(
        [Parameter(Mandatory)]
        [string]$UserId,
        [Parameter(Mandatory)]
        [string]$CompanyName
    )
    try {
        if ($PSCmdlet.ShouldProcess("User: $UserId", "Set company name to: $CompanyName")) {
            Update-MgUser -UserId $UserId -CompanyName $CompanyName
        }
    }
    catch {
        Write-Error $_.Exception.Message
        return $false
    }
    return $true
}