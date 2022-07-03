function Add-MozambiqueHereEndpoint {
    [CmdletBinding()]
    param (
        [string]$endpointUrl = "https://api.mozambiquehe.re",
        [string]$envName = "MozambiqueHereEndpoint"
    )
    
    process {
        #Load new env into current session
        New-Item -Force -Path "Env:" -Name $envName -Value $endpointUrl | Out-Null
        #Create new env to make it persistent between sessions
        [System.Environment]::SetEnvironmentVariable($envName,$endpointUrl,[System.EnvironmentVariableTarget]::User)
    }
}