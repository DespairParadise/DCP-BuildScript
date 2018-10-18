$mpc = "https://freefr.dl.sourceforge.net/project/mpcbe/MPC-BE/Nightly%20Builds%20%28from%20svn%20trunk%29/1.5.2%20%28build%203973%29%20beta/MPC-BE.1.5.2.3973.x64.7z"
$mad = "http://madshi.net/madVR.zip"
$lav = "https://github.com/Nevcairiel/LAVFilters/releases/download/0.73.1/LAVFilters-0.73.1-x64.zip"
$xys = "https://github.com/Cyberbeing/xy-VSFilter/releases/download/3.1.0.752/XySubFilter_3.1.0.752_x64.zip"
$syn = "https://github.com/Syncplay/syncplay/releases/download/v1.6.0/Syncplay_1.6.0_Portable.zip"


mkdir "Downloads"

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

