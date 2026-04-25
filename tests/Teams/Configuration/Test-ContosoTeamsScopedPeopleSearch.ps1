function Test-ContosoTeamsScopedPeopleSearch {
    <#
    .SYNOPSIS
        Reviews scoped people search and access settings
    .DESCRIPTION
        TEAMS.TC.5042 - Informational test to review whether people search is scoped
        to specific groups or the entire directory for privacy considerations.
    #>
    $result = $true

    try {
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        $clientConfig = Get-CsTeamsClientConfiguration
        $scopedSearch = $clientConfig.AllowScopedPeopleSearchandAccess

        if ($scopedSearch -eq $true) {
            $TestResults = "Scoped people search is enabled. Users can search within defined scopes."
        } else {
            $TestResults = "Scoped people search is disabled. All users can search the entire directory."
        }
        
        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
