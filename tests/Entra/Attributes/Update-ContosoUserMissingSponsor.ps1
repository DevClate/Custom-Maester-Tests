Function Update-ContosoUserMissingSponsor {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$UserID,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]$Sponsor
    )

    try {
        # Retrieve the Sponsor's objectId from UPN
        $SponsorId = (Get-MgUser -UserId $Sponsor).Id
        if (-not $SponsorId) {
            Write-Error "Could not find sponsor: $Sponsor"
            return
        }

        # Build the request body for the POST operation
        $Body = @{
            '@odata.id' = "https://graph.microsoft.com/beta/users/$SponsorId"
        }

        # Create the sponsor reference URI for the *guest* user
        $Uri = "https://graph.microsoft.com/beta/users/$UserID/sponsors/`$ref"

        # Update sponsor by POSTing the sponsor reference
        Invoke-MgGraphRequest -Uri $Uri -Method POST -Body $Body

    }
    catch {
        Write-Error $_.Exception.Message
        return $false
    }
    return $true
}
