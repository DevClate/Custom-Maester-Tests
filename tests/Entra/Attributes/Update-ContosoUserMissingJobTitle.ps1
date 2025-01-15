# Powershell function to update a user's job title attribute in the Contoso directory
# Do not need this one as
function Update-ContosoUserMissingJobTitle {
    [CmdletBinding(SupportsShouldProcess=$true)]
    param(
        [Parameter(Mandatory)]
        [string]$UserId,
        [Parameter(Mandatory)]
        [string]$JobTitle
    )

    try {
        if ($PSCmdlet.ShouldProcess("User: $UserId", "Set job title to: $JobTitle")) {
            Update-MgUser -UserId $UserId -JobTitle $JobTitle
        }
    }
    catch {
        Write-Error $_.Exception.Message
        return $false
    }

    return $true
}