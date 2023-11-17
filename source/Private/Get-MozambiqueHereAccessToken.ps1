function Get-MozambiqueHereAccessToken {
    [CmdletBinding()]
    param (
        [string]$AccessTokenPath = "$env:USERPROFILE\.creds\MozambiqueHere\MozambiqueHereAccessToken.xml"
    )

    process {
        if (!(Test-Path $AccessTokenPath)) {
            New-MozambiqueHereAccessToken
        }
    
        Import-Clixml $AccessTokenPath | ConvertFrom-SecureString -AsPlainText
    }
}