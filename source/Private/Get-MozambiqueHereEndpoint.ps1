function Get-MozambiqueHereEndpoint {
    [CmdletBinding()]
    param ()

    process {
        if (!$env:MozambiqueHereEndpoint) {
            Add-MozambiqueHereEndpoint
        }
        #Gets endpoint from env variable
        $env:MozambiqueHereEndpoint
    }
}