# This is the GeminiNuker v1!


$regChrome = Test-Path -Path "HKLM:\SOFTWARE\Policies\Google\Chrome"

if (Test-Path -Path 'C:\Temp\GeminiNukerLogs') {

    
   Write-Host "Logs already exists!"


} else {

    New-Item -Path "C:\Temp" -Name "GeminiNukerLogs"

}

if ($regChrome -eq $true) {

    Add-Content -Path "C:\Temp\GeminiNukerLogs" -Value "Reg entry is available for Chrome!"

} else {

    Add-Content -Path "C:\Temp\GeminiNukerLogs" -Value "Reg entry is not available for Chrome!"
    exit 1

}

Add-Content -Path "C:\Temp\GeminiNukerLogs" -Value "Adding flag to Registry..."

New-Item -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Force

New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name 'GeminiSettings' -Value 1 -PropertyType DWord -Force

New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name 'AIModeSettings' -Value 1 -PropertyType DWord -Force

Add-Content -Path "C:\Temp\GeminiNukerLogs" -Value "Added flag. Running check now."

if ((Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Google\Chrome" -ErrorAction SilentlyContinue).GeminiSettings -eq 1) {

Add-Content -Path "C:\Temp\GeminiNukerLogs" -Value "GeminiSettings exists! Killing Chrome now to make sure it reloads."


} else {

    Add-Content -Path "C:\Temp\GeminiNukerLogs" -Value "GeminiSettings doesn't exist! Exiting."
    exit 1
}

if ((Get-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Google\Chrome" -ErrorAction SilentlyContinue).AIModeSettings -eq 1) {

Add-Content -Path "C:\Temp\GeminiNukerLogs" -Value "AIModeSettings exists! Killing Chrome now to make sure it reloads."


} else {

    Add-Content -Path "C:\Temp\GeminiNukerLogs" -Value "AIModeSettings doesn't exist! Exiting."
    exit 1
}

Stop-Process -Name "Chrome" -Force



