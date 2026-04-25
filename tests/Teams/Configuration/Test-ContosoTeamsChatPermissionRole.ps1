function Test-ContosoTeamsChatPermissionRole {
    <#
    .SYNOPSIS
        Checks chat creation permissions in Teams
    .DESCRIPTION
        TEAMS.TC.5018 - Control who can create group chats and meetings
    #>
    $result = $true

    try {
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        $TeamsMessagingPolicy = Get-CsTeamsMessagingPolicy
        $TeamsMessagingPolicyGlobal = $TeamsMessagingPolicy | Where-Object { $_.Identity -eq "Global" }
        $portalLink_MessagingPolicy = "https://admin.teams.microsoft.com/policies/messaging"

        $chatPermissionRole = if ($null -ne $TeamsMessagingPolicyGlobal.ChatPermissionRole) { 
            $TeamsMessagingPolicyGlobal.ChatPermissionRole.ToString() 
        } else { 
            "Not Set" 
        }

        $TestResults = "ℹ️ ChatPermissionRole in [Messaging policies]($portalLink_MessagingPolicy) is currently set to $chatPermissionRole. Review this setting based on your organization's collaboration requirements. This setting controls the default permissions for users in group chats. Options include 'Full' (can add/remove users), 'Limited' (cannot remove users they didn't add), and 'Restricted'. Review based on your collaboration and security needs."

        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
