Write-Host
Write-Host ===================================================
Write-Host Despair Codec Pack
Write-Host Powershell Automatic Build Script
Write-Host Maintainer : Automne von Einzbern
Write-Host Version : 0.2
Write-Host ===================================================
Write-Host

# Sourcing URLs
. .\URLVars.ps1

# Downloading Files
Write-Host "[+] Downloading MPC-BE"
Invoke-WebRequest -Uri $mpc -OutFile ".\Downloads\mpcbe.7z"
Write-Host "[+] Downloading LAVFilters"
Invoke-WebRequest -Uri $lav -OutFile ".\Downloads\lavfilters.zip"
Write-Host "[+] Downloading madVR"
Invoke-WebRequest -Uri $mad -OutFile ".\Downloads\madvr.zip"
Write-Host "[+] Downloading XySubFilter"
Invoke-WebRequest -Uri $xys -OutFile ".\Downloads\xysubfilter.zip"
Write-Host "[+] Downloading SyncPlay"
Invoke-WebRequest -Uri $syn -OutFile ".\Downloads\syncplay.zip"


# Dezipping folder
Write-Host "[+] Extracting packages"
.\7Zip\7za.exe x .\Downloads\mpcbe.7z -bso0 -aoa -oExtracted\MPC-BE
.\7Zip\7za.exe x .\Downloads\lavfilters.zip -bso0 -aoa -oExtracted\LAVFilters
.\7Zip\7za.exe x .\Downloads\madvr.zip -bso0 -aoa -oExtracted\madVR
.\7Zip\7za.exe x .\Downloads\xysubfilter.zip -bso0 -aoa -oExtracted\XySubFilter
.\7Zip\7za.exe x .\Downloads\syncplay.zip -bso0 -aoa -oExtracted\Syncplay

# Moving MPC-BE extracted folder to the correct directory
Write-Host "[+] Fixing directories"
$folderName = cmd /c dir Extracted\MPC-BE\MPC* /b
$extractedFolder = "Extracted\MPC-BE\" + $folderName + "\*"
Move-Item $extractedFolder Extracted\MPC-BE
Remove-Item ("Extracted\MPC-BE\" + $folderName)

# Downloading Inno Setup
Write-Host "[?] Looking for Inno Setup"
if (!(Test-Path "C:\Program Files (x86)\Inno Setup 5\ISCC.exe"))
{
	Write-Host "[-] Inno Setup not found in Program Files (x86)"
	Write-Host "[+] Downloading Inno Setup"
	Invoke-WebRequest -Uri "http://www.jrsoftware.org/download.php/is.exe" -out ".\Downloads\is.exe"
	Write-Host "[+] Installing Inno Setup"
	.\Downloads\is.exe /VERYSILENT
	Start-Sleep -s 10
}

# Building DCP
Write-Host "[+] Building Despair Codec Pack"
Start-Sleep -s 2
. "C:\Program Files (x86)\Inno Setup 5\ISCC.exe" .\setup.iss

# Printing Checksums
Write-Host -NoNewline  "[*] MD5 :   "
.\fciv.exe -md5 $(Get-ChildItem .\Output\*exe) | findstr "exe" | %{$_.split(' ')[0]}
Write-Host -NoNewline  "[*] SHA-1 : "
.\fciv.exe -sha1 $(Get-ChildItem .\Output\*exe) | findstr "exe" | %{$_.split(' ')[0]}

Write-Host "[*] Done."