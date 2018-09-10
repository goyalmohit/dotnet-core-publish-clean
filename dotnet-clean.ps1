# This script clears dotnet core publish directory
[CmdletBinding()]
Param (
    # Defines the publish directory name
    [parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String] $directory,

    # Defines the full path for working directory context
    [parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [String] $workingdirectory
)

# Determines the context of working directory
if(Test-Path $workingdirectory){
   Set-Location $workingdirectory
}
else{
   Write-Host "Provided working directory does not exists"
   Write-Host "Proceeding in the current directory: $pwd"
}

# Clears all files present in the publish directory
foreach($Item in (Get-ChildItem -Recurse -Directory | Where {$_.Name -eq $directory})){
   Write-Host "Removing $($item.FullName)"
   Remove-Item $($Item.FullName) -Force -Recurse -ErrorAction SilentlyContinue
}

Write-Host "End of script."