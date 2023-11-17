function Invoke-MozambiqueHereBridgeRequest {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,ParameterSetName="Get user by UID")][string]$UID,
        [Parameter(Mandatory,ParameterSetName="Get user by name")][string]$player,
        [Parameter(Mandatory)][string][ValidateSet("PC","PS4","X1")]$Platform,
        [string]$ApiKey = $(Get-MozambiqueHereAccessToken)
    )
    
    process {
        $ParameterExclusion = @("ApiKey")
        $Body = $null
        $PSBoundParameters.Keys.ForEach({
            [string]$Key = ($_).ToLower()
            $Value = $PSBoundParameters.$key
        
            if ($ParameterExclusion -contains $Key) {
                return
            }
        
            $Body += @{
                $Key = $Value
            }
        })

        $Body += @{
            "auth" = $ApiKey
        }

        $splat = @{
            "Method" = "GET"
            "Uri" = "https://api.mozambiquehe.re/bridge"
            "Body" = $Body
        }

        #Write-Output $splat
        Invoke-RestMethod @splat
    }
}