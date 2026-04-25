function Test-ContosoTeamsNotifySfbUsers {
    <#
    .SYNOPSIS
        Reviews Skype for Business user notification settings
    .DESCRIPTION
        TEAMS.TC.5036 - Informational test to review whether Skype for Business users
        are notified about the Teams upgrade.
    #>
    $result = $true

    try {
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        $upgradeConfig = Get-CsTeamsUpgradeConfiguration
        $notifySfbUsers = $upgradeConfig.NotifySfbUsers

        if ($notifySfbUsers -eq $true) {
            $TestResults = "Skype for Business users are being notified about the Teams upgrade."
        } else {
            $TestResults = "Skype for Business user notifications are disabled. Consider enabling if you have SfB users."
        }
        
        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
