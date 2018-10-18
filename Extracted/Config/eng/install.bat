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

@echo    Clearing Previous Registry Entries
@start /min reg delete HKEY_CURRENT_USER\Software\madshi\madVR /f
@start /min reg delete HKEY_CURRENT_USER\Software\MPC-BE /f

@echo    Registering MPC-BE
@cd MPC-BE
@regsvr32.exe /s MPCBEShellExt64.dll
@cd ..

@echo    Registering LAVFilters
@cd LAVFilters
@regsvr32.exe /s LAVSplitter.ax
@regsvr32.exe /s LAVVideo.ax
@regsvr32.exe /s LAVAudio.ax
@cd ..

@echo    Registering ASSFilterMod
@cd ASSFilterMod
@regsvr32.exe /s assfiltermod.dll
@cd ..

@echo    Registering madVR
@cd madVR
@regsvr32.exe /s madVR.ax
@regsvr32.exe /s madVR64.ax
@cd ..

@echo    Installing Config
@cd Config
@regedit.exe /s mpc-be-settings.reg
@DCP-OneTime.exe
@cd ..

@echo    Associating Extensions
@cd MPC-BE
@mpc-be64.exe /regvid
@cd ..


   
@echo. 
@echo    Setup completed ;)
@echo    This window will close automatically
@echo    Don't hesitate to take a walk on our Discord
@echo.  

@ping localhost -n 10 >NUL
