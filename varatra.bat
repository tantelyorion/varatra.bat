@echo off
chcp 1252 >nul

:: ================================================
:: DEMANDE AUTOMATIQUE DE DROITS ADMINISTRATEUR
:: ================================================
setlocal
set "params=%*"
cd /d "%~dp0"
if exist "%temp%\getadmin.vbs" del /f /q "%temp%\getadmin.vbs"

:: Création du script VBS pour élévation de privilèges
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

:: Test des droits admin
NET SESSION >nul 2>&1
if %errorlevel% neq 0 (
    echo Demande de privilèges administrateur...
    start "" "%temp%\getadmin.vbs"
    exit /b
)

:: ================================================
:: PROGRAMME PRINCIPAL
:: ================================================
title Verrouillage USB Instantané (Admin)
color 0A
mode con: cols=70 lines=25

:menu
cls
echo ====================================================
echo              Bienvenue sur VARATRA.bat
echo      Verrouillage USB Instantané - Par Tantely Orion
echo ====================================================
echo.
echo   [1] Verrouiller un lecteur USB en écriture
echo   [2] Déverrouiller un lecteur USB
echo   [3] Quitter
echo.
set /p choix="  Choisissez une option (1-3) : "

if "%choix%"=="1" goto verrouiller
if "%choix%"=="2" goto deverrouiller
if "%choix%"=="3" goto fin
echo Option invalide. Veuillez choisir 1, 2 ou 3.
timeout /t 2 >nul
goto menu

:verrouiller
cls
call :afficher_usb
set /p lecteur="Entrez la lettre du lecteur USB (ex: E): "
if not exist "%lecteur%:\" (
    echo ERREUR : Lecteur "%lecteur%" introuvable.
    pause
    goto menu
)
echo Activation du verrouillage en écriture...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorageDevicePolicies" /v WriteProtect /t REG_DWORD /d 1 /f >nul
echo.
echo  Le verrouillage est activé. Rebranchez la clé USB pour appliquer.
pause
goto menu

:deverrouiller
cls
call :afficher_usb
set /p lecteur="Entrez la lettre du lecteur USB (ex: E): "
if not exist "%lecteur%:\" (
    echo ERREUR : Lecteur "%lecteur%" introuvable.
    pause
    goto menu
)
echo Désactivation du verrouillage...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorageDevicePolicies" /v WriteProtect /t REG_DWORD /d 0 /f >nul
echo.
echo  Le verrouillage est désactivé. Rebranchez la clé USB pour appliquer.
pause
goto menu

:afficher_usb
echo Liste des lecteurs USB détectés :
echo ----------------------------------
wmic logicaldisk where "DriveType=2" get DeviceID, VolumeName, Description | findstr /R "[A-Z]:"
echo.
exit /b

:fin
endlocal
exit
