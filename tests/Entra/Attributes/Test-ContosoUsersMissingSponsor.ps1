function Test-ContosoUsersMissingSponsor {
    $result = $true

    try {
        $users = Get-MgBetaUser -Property "displayName,jobTitle,authorizationInfo" -ExpandProperty "sponsors"
        $usersWithoutSponsor = @()

        foreach ($user in $users) {
            Write-Output $user | Format-List *

            if ($user.jobTitle -eq "CEO" -or $user.displayName -eq "On-Premises Directory Synchronization Service Account") {
                continue
            }

            if (-not $user.sponsors -or [string]::IsNullOrEmpty($user.sponsors[0])) {
                $result = $false
                $usersWithoutSponsor += $user
            }
        }

        if ($result) {
            $TestResults = "Well done! There were no users without a sponsor assigned."
        } else {
            $TestResults = "No sponsor is assigned for the following users:users:`n%TestResult%"
        }

        Add-MtTestResultDetail -Result $TestResults -GraphObjects $usersWithoutSponsor -GraphObjectType Users
    } catch {
        $result = $false
        Write-Error $_.Exception.Message
    }
    return $result
}