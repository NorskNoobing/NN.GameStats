function Add-MozambiqueHereCredentials {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]$APIKey,
        [string]$envName = "MozambiqueHereAPIKey"
    )

    process {
        #Convert API key to encrypted string
        [string]$encryptedAPIKey = ($APIKey | ConvertTo-SecureString -AsPlainText | ConvertFrom-SecureString)
        #Load new env into current session
        New-Item -Force -Path "Env:" -Name $envName -Value $encryptedAPIKey | Out-Null
        #Create new env to make it persistent between sessions
        [System.Environment]::SetEnvironmentVariable($envName,$encryptedAPIKey,[System.EnvironmentVariableTarget]::User)
    }
}