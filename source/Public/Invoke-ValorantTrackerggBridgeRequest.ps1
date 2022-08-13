function Invoke-ValorantTrackerggBridgeRequest {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)][array]$RiotTags
    )
    
    process {
        $RiotTags = $RiotTags -replace "#","%23"
        $RiotTags | ForEach-Object -ThrottleLimit 20 -Parallel {
            $username = $_

            $splat = @{
                "Method" = "GET"
                "Uri" = "https://valorant.tracker.gg/profile/riot/$username/overview"
                "Headers" = @{
                    "User-Agent" = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36"
                }
            }

            try {
                $null = Invoke-WebRequest @splat
            }
            catch {
                if (($_.exception.response.statuscode) -eq "NotFound") {
                    throw "User $username was not found"
                } else {
                    $_
                }
            }
        }
    }
}