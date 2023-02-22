##Variabelen om te checken of er wat bestaat
$versionserver = Invoke-RestMethod -Uri https://endpoint.eoo.cloud/Installers/Coligo/version.json
$versionlocal = (get-content "$env:APPDATA\Coligo Desktop\version.json") | ConvertFrom-Json 

##Make directory Coligo Desktop
mkdir "$env:appdata\Coligo Desktop" -ErrorAction ignore

##install software
if( -not(Test-Path -Path "$env:APPDATA\Coligo Desktop\version.json" -PathType Leaf) -or ($versionserver[0].version -gt $versionlocal[0].version)){
  ##Remove Coligo Desktop shortcuts
  Remove-Item -Path "$env:OnedriveCommercial\Desktop\Coligo*" -Recurse -ErrorAction Ignore
  Remove-Item -Path "$env:OnedriveCommercial\Bureaublad\Coligo*" -Recurse -ErrorAction Ignore
  Remove-Item -Path "$env:HOMEPATH\Desktop\Coligo*" -Recurse -ErrorAction Ignore
  Remove-Item -Path "$env:HOMEPATH\Bureaublad\Coligo*" -Recurse -ErrorAction Ignore
  
  ##Download Software
  Invoke-WebRequest -Uri "https://endpoint.eoo.cloud/Installers/Coligo/ColigoSetup.exe" -OutFile "$env:APPDATA\Coligo Desktop\ColigoSetup.exe"
  
  ##Install Software en set version.json 
  Set-Location "$env:APPDATA\Coligo Desktop"
  .\ColigoSetup.exe /S
  Remove-Item -Path "$env:APPDATA\Coligo Desktop\version.json" -Recurse -ErrorAction Ignore
  Invoke-WebRequest -Uri "https://endpoint.eoo.cloud/Installers/Coligo/version.json" -OutFile "$env:APPDATA\Coligo Desktop\version.json"}



  else {}
