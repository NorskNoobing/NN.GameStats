function New-MozambiqueHereAccessToken {
    [CmdletBinding()]
    param (
        [string]$AccessTokenPath = "$env:USERPROFILE\.creds\MozambiqueHere\MozambiqueHereAccessToken.xml"
    )

    process {
        $ApiKey = Read-Host "Enter MozambiqueHere API key" -AsSecureString
    
        #Create parent folders of the access token file
        $AccessTokenDir = $AccessTokenPath.Substring(0, $AccessTokenPath.lastIndexOf('\'))
        if (!(Test-Path $AccessTokenDir)) {
            $null = New-Item -ItemType Directory $AccessTokenDir
        }

        #Create access token file
        $ApiKey | Export-Clixml $AccessTokenPath
    }
}