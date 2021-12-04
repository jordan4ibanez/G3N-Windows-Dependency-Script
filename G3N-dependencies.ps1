
$currentPath = Get-Location

#getting user confirmation so they do not accidentally put this somewhere crazy like C:\Windows\sysWOW64\

Write-Host "This is designed to be run where you wish to store mingw-w64 for building. PLEASE ensure you are in the correct directory ($currentPath) before continuing."
Write-Host "Requirements are: 7zip (default install path), Git (default install path)"

$userConfirmation = Read-Host "Please type YES (caps included) if you wish to continue"

if ($userConfirmation -eq "YES" ) {
    Write-Host "User initialization accepted."
} else {
    Write-Host "User initialzation aborted. Exiting."

    Exit -1
}

Write-Host "Checking if 7zip is installed (default path - C:\Program Files\7-Zip\). If custom path, you can edit this script to reflect it."

if (Test-Path -Path "C:\Program Files\7-Zip\") {
    
    Write-Host "7zip was successfully detected."

} else {

    Write-Host "7zip was not detected. You can get 7zip here: https://www.7-zip.org"

    Write-Host "Please run this script again when 7zip is installed or the path has been adjusted as this script requires it to extract mingw-w64. Thank you."

    Write-Host "Exiting."

    Exit -1
}


Write-Host "Checking if git is installed (default path - C:\Program Files\Git\). If Custom path, you can edit this script to reflect it."

if ((Test-Path -Path "C:\Program Files\Git\") -and (Test-Path -Path "C:\Program Files\Git\bin\")) {
    
    Write-Host "Git was successfully detected."

} else {

    Write-Host "7zip was not detected. You can get 7zip here: https://www.7-zip.org"

    Write-Host "Please run this script again when 7zip is installed or the path has been adjusted as this script requires it to extract mingw-w64. Thank you."

    Write-Host "Exiting."

    Exit -1
}



Write-Host "Grabbing mingw-w64 toolchain (7z formatted)..."

#Yes, this is a very long address
Invoke-WebRequest -uri "https://versaweb.dl.sourceforge.net/project/mingw-w64/Toolchains%20targetting%20Win64/Personal%20Builds/mingw-builds/8.1.0/threads-posix/seh/x86_64-8.1.0-release-posix-seh-rt_v6-rev0.7z" -Outfile mingw-toolchain.7Z

Write-Host "Unzipping mingw-w64 toolchain..."

set-alias sz "C:\Program Files\7-Zip\7z.exe"

Invoke-Expression "sz x $currentPath\mingw-toolchain.7Z -o$currentPath\mingw-w64\ -y"



