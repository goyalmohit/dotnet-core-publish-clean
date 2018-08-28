[CmdletBinding()]
Param (
    [parameter(Mandatory=$true)]
    [String] $directory,

    [parameter(Mandatory=$true)]
    [String] $workingdirectory
)

if(Test-Path $workingdirectory){
   Set-Location $workingdirectory
}
else{
   Write-Host "Provided working directory does not exists"
   Write-Host "Proceeding in the current directory: $pwd"
}

foreach($Item in (Get-ChildItem -Recurse -Directory | Where {$_.Name -eq $directory})){
   Write-Host "Removing $($item.FullName)"
   Remove-Item $($Item.FullName) -Force -Recurse -ErrorAction SilentlyContinue
}
