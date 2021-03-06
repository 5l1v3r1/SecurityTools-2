﻿$invocation = (Get-Variable MyInvocation).Value
$directorypath = Split-Path $invocation.MyCommand.Path

try {
    $ip = Invoke-RestMethod http://ipinfo.io/json | Select -exp ip
    $hostname = $env:COMPUTERNAME.ToLower()
    $date = Get-Date -format "MMM dd \@ HH\:mm"
    Add-Content "$directorypath\IPs.txt" "$date HOST: $hostname - $ip"
}
catch {
    Write-Output $_
}