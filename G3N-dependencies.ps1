$currentPath = Get-Location

if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    exit;
}

#getting user confirmation so they do not accidentally put this somewhere crazy like C:\Windows\sysWOW64\

Write-Host "This is designed to be run where you wish to store mingw-w64 for building. PLEASE ensure you are in the correct directory ($currentPath) before continuing."
Write-Host "WARNING: You must not delete or move this folder, it stores your gcc compiler path in your user PATH for when you build your G3N programs."
Write-Host "Requirements are: 7zip (default install path), Git (default install path), Go"

$userConfirmation = Read-Host "Please type YES (capitalized) if you wish to continue"

if ($userConfirmation -eq "YES" ) {
    Write-Host "User initialization accepted."
} else {
    Write-Host "User initialzation aborted. Exiting."

    Exit -1
}

#7zip install check

Write-Host "Checking if 7zip is installed (default path - C:\Program Files\7-Zip\). If custom path, you can edit this script to reflect it."

if (Test-Path -Path "C:\Program Files\7-Zip\") {
    
    Write-Host "7zip was successfully detected."

} else {

    Write-Host "7zip was not detected. You can get 7zip here: https://www.7-zip.org"

    Write-Host "Please run this script again when 7zip is installed or the path has been adjusted as this script requires it to extract mingw-w64. Thank you."

    Write-Host "Exiting."

    Exit -1
}

#git install check

Write-Host "Checking if git is installed (default path - C:\Program Files\Git\). If Custom path, you can edit this script to reflect it."

if ((Test-Path -Path "C:\Program Files\Git\") -and (Test-Path -Path "C:\Program Files\Git\bin\")) {
    
    Write-Host "Git was successfully detected."

} else {

    Write-Host "Git was not detected. You can get Git here: https://git-scm.com"

    Write-Host "Please run this script again when Git is installed or the path has been adjusted as this script requires it to clone G3N. Thank you."

    Write-Host "Exiting."

    Exit -1
}


Write-Host "Grabbing mingw-w64 toolchain (7z formatted)..."

#Yes, this is a very long address - this is also probably not the fastest around the world - but I can only pick the fastest that I can find for my location from sourceforge

Invoke-WebRequest -uri "https://versaweb.dl.sourceforge.net/project/mingw-w64/Toolchains%20targetting%20Win64/Personal%20Builds/mingw-builds/8.1.0/threads-posix/seh/x86_64-8.1.0-release-posix-seh-rt_v6-rev0.7z" -Outfile mingw-toolchain.7Z

Write-Host "Unzipping mingw-w64 toolchain..."

set-alias sz "C:\Program Files\7-Zip\7z.exe"

Invoke-Expression "sz x $currentPath\mingw-toolchain.7Z -o$currentPath\mingw-w64\ -y"

#this needs to be permenant otherwise you will not be able to build G3N programs

Write-Host "mingw-w64 extraction successful. Adding to user path."

$oldPath = (Get-ItemProperty -Path 'Registry::HKEY_CURRENT_USER\Environment' -Name PATH).path
$newPath = "$oldPath;$currentPath\mingw-w64\mingw64\bin"
Set-ItemProperty -Path 'Registry::HKEY_CURRENT_USER\Environment' -Name PATH -Value $newPath

#now we add it to the system path as well

Write-Host "Adding to system path."

$oldpath = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH).path
$newPath = "$oldPath;$currentPath\mingw-w64\mingw64\bin"
Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name PATH -Value $newPath

#now we add it to the internal temporary path so that G3N can build from this script

$env:Path += ";$currentPath\mingw-w64\mingw64\bin"

Write-Host "Successfully added to user and system path."


#clone and cd into the go build directory

Write-Host "Cloning G3N from Github..."

Invoke-Expression "git clone https://github.com/g3n/engine g3n-engine"

Invoke-Expression "cd g3n-engine"

Invoke-Expression "go install ./..."

#this takes us out of the go build directory

Invoke-Expression "cd .."

#finally add OpenAL dynamic linked libraries to the system path for building




Read-Host "Installation successful. Press enter to exit."