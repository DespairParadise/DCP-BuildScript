@echo off
@chcp 28591 > nul
@echo    Despair-Paradise Codec Pack
@echo.
@echo    Version: 1.9.1-marika
@echo    Website: despair-paradise.com
@echo    Discord: discord.me/despair-paradise
@echo.
@echo    ==========================================
@echo.

@cd /d "%~dp0"

@echo    Nettoyage des versions précédentes
@start /min reg delete HKEY_CURRENT_USER\Software\madshi\madVR /f
@start /min reg delete HKEY_CURRENT_USER\Software\MPC-BE /f

@echo    Enregistrement du MPC-BE
@cd MPC-BE
@regsvr32.exe /s MPCBEShellExt64.dll
@cd ..

@echo    Enregistrement des LAVFilters
@cd LAVFilters
@regsvr32.exe /s LAVSplitter.ax
@regsvr32.exe /s LAVVideo.ax
@regsvr32.exe /s LAVAudio.ax
@cd ..

@echo    Enregistrement de ASSFilterMod
@cd ASSFilterMod
@regsvr32.exe /s assfiltermod.dll
@cd ..

@echo    Enregistrement de madVR
@cd madVR
@regsvr32.exe /s madVR.ax
@regsvr32.exe /s madVR64.ax
@cd ..

@echo    Installations des Configs
@cd Config
@regedit.exe /s mpc-be-settings.reg
@DCP-OneTime.exe
@cd ..

@echo    Association des extensions
@cd MPC-BE
@mpc-be64.exe /regvid
@cd ..

   
@echo. 
@echo    Installation terminée ;)
@echo    La fenêtre va se fermer automatiquement
@echo    N'hésitez pas à faire un tour sur notre Discord
@echo.  

@ping localhost -n 10 >NUL
