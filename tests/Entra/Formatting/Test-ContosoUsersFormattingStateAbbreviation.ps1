function Test-ContosoUsersFormattingStateAbbreviation {
    $result = $true
    try {
        $users = Invoke-MtGraphRequest -RelativeUri "users" -Filter "userType eq 'Member'" -Select "displayName","state"
        $incorrectStates = @()

        foreach ($user in $users) {
            if ([string]::IsNullOrEmpty($user.state)) {
                $result = $false
                $incorrectStates += $user
                continue
            }
            # Expected format: Two uppercase letters (no periods). Example: CA
            if ($user.state -notmatch '^[A-Z]{2}$') {
                $result = $false
                $incorrectStates += $user
            }
        }

        if ($result) {
            Add-MtTestResultDetail -Result "All users have the correct US state format (e.g. CA)." -GraphObjects @() -GraphObjectType Users
        } else {
            Add-MtTestResultDetail -Result "Some users have an incorrect state format.`n%TestResult%" -GraphObjects $incorrectStates -GraphObjectType Users
        }
    }
    catch {
        $result = $false
        Write-Error $_.Exception.Message
    }
    return $result
}