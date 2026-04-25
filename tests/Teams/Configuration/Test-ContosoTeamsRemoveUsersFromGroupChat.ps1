function Test-ContosoTeamsRemoveUsersFromGroupChat {
    <#
    .SYNOPSIS
        Reviews owner message deletion permissions in group chats
    .DESCRIPTION
        TEAMS.TC.5041 - Informational test to review whether chat owners can delete
        messages from group chats for governance purposes.
    #>
    $result = $true

    try {
        if (!(Test-MtConnection Teams)) {
            Add-MtTestResultDetail -SkippedBecause NotConnectedTeams
            return $null
        }

        $messagingPolicy = Get-CsTeamsMessagingPolicy -Identity Global
        $ownerDelete = $messagingPolicy.AllowOwnerDeleteMessage

        if ($ownerDelete -eq $true) {
            $TestResults = "Chat owners can delete messages for governance purposes."
        } else {
            $TestResults = "Chat owners cannot delete messages. Consider enabling this for chat moderation."
        }
        
        Add-MtTestResultDetail -Result $TestResults

    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }

    return $result
}
