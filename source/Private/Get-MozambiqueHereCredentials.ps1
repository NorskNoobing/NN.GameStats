function Get-MozambiqueHereCredentials {
    [CmdletBinding()]
    param ()
    
    process {
        if (!$env:MozambiqueHereAPIKey) {
            Add-MozambiqueHereCredentials
        }
        #Gets API key from env variable
        $env:MozambiqueHereAPIKey | ConvertTo-SecureString | ConvertFrom-SecureString -AsPlainText
    }
}