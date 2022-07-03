function Invoke-TrackerggBridgeRequest {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)][array]$OriginUsernames
    )
    
    process {
        $OriginUsernames | ForEach-Object -ThrottleLimit 20 -Parallel {
            try {
                $splat = @{
                    "Method" = "GET"
                    "Uri" = "https://apex.tracker.gg/apex/profile/origin/$($_)/matches"
                    "Headers" = @{
                        "User-Agent" = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36"
                    }
                }
                $null = Invoke-WebRequest @splat
            }
            catch {
                if (($_.exception.response.statuscode) -eq "NotFound") {
                    $username = ($_.exception.response.requestmessage.requesturi -split "/")[6]
                    throw "User $username was not found"
                } else {
                    $_
                }
            }
        }
    }
}