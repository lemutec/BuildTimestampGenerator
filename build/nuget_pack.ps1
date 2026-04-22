$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Path $PSScriptRoot -Parent
$projectPath = Join-Path -Path $repoRoot -ChildPath 'BuildTimestampGenerator.csproj'
$outputPath = Join-Path -Path $repoRoot -ChildPath 'build'

Set-Location $repoRoot

Write-Host @"
███╗   ██╗██╗   ██╗ ██████╗ ███████╗████████╗
████╗  ██║██║   ██║██╔════╝ ██╔════╝╚══██╔══╝
██╔██╗ ██║██║   ██║██║  ███╗█████╗     ██║   
██║╚██╗██║██║   ██║██║   ██║██╔══╝     ██║   
██║ ╚████║╚██████╔╝╚██████╔╝███████╗   ██║   
╚═╝  ╚═══╝ ╚═════╝  ╚═════╝ ╚══════╝   ╚═╝   
"@

Write-Host "Processing BuildTimestampGenerator"
dotnet restore $projectPath
dotnet build $projectPath -c Release
dotnet pack $projectPath -c Release -o $outputPath

Write-Host "`nPackages written to: $outputPath"
