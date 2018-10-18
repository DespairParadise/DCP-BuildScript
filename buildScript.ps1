
# Sourcing URLs
. .\URLVars.ps1


# Downloading Files
Write-Host "Downloading MPC-BE"
Invoke-WebRequest -Uri $mpc -OutFile ".\Downloads\mpcbe.7z"
Write-Host "Downloading LAVFilters"
Invoke-WebRequest -Uri $lav -OutFile ".\Downloads\lavfilters.zip"
Write-Host "Downloading madVR"
Invoke-WebRequest -Uri $mad -OutFile ".\Downloads\madvr.zip"
Write-Host "Downloading XySubFilter"
Invoke-WebRequest -Uri $xys -OutFile ".\Downloads\xysubfilter.zip"
Write-Host "Downloading SyncPlay"
Invoke-WebRequest -Uri $syn -OutFile ".\Downloads\syncplay.zip"

