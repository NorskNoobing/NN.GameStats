function Invoke-MozambiqueHereBridgeRequest {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)][string]$UID,
        [Parameter(Mandatory)][string][ValidateSet("PC","PS4","X1")]$Platform
    )
    
    process {
        $splat = @{
            "Method" = "GET"
            "Uri" = "$(Get-MozambiqueHereEndpoint)/bridge"
            "Body" = @{
                "platform" = $Platform
                "auth" = Get-MozambiqueHereCredentials
                "uid" = $UID
            }
        }
        Invoke-RestMethod @splat
    }
}