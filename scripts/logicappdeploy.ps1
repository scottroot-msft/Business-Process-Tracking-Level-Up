$ErrorActionPreference = 'Stop'
$dir = $PSScriptRoot
$root = Resolve-Path "$dir/../"

# jump into the script root
# "Running scripts from root $root"
Push-Location $root

New-Item -Force -Path "output" -ItemType "directory"

##----------------------------------------------
## Deploy Azure Logic Apps
Write-Host "- Setting up Logic App"

Compress-Archive -Path .\src\patient-tracking\LogicApps\* -DestinationPath .\output\workflows.zip -Force
az logicapp deployment source config-zip --name logic-hospitalintegration  --resource-group rg-business-process-levelup --src .\output\workflows.zip

Write-Host "- Logic App Setup Complete"
Push-Location $dir