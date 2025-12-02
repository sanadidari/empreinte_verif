@echo off
cls
echo =======================================================
echo         SANAD IDARI — SYNC GITHUB PRO MODE v1.1
echo =======================================================
echo.

REM === CONFIGURATION GITHUB : TON COMPTE ===
set GIT_USER=sanadidari
set GIT_EMAIL=schatwiti@gmail.com
set REPO_URL=https://github.com/sanadidari/empreinte_verif.git
set BRANCH=main

REM === CHEMIN LOCAL DU PROJET FLUTTER ===
set PROJECT_DIR=C:\samir_flutter\empreinte_verif

echo 🔧 Configuration Git...
git config --global user.name "%GIT_USER%"
git config --global user.email "%GIT_EMAIL%"

echo.
echo 📁 Ouverture du projet : %PROJECT_DIR%
cd "%PROJECT_DIR%"

echo.
echo 🔍 Vérification si le dépôt Git est initialisé...
if not exist ".git" (
    echo 🚀 Aucun dépôt Git détecté — Initialisation...
    git init
)

echo.
echo 🔄 Vérification de la branche actuelle...
for /f "tokens=*" %%i in ('git branch --show-current') do set CURRENT_BRANCH=%%i

if "%CURRENT_BRANCH%"=="" set CURRENT_BRANCH=master

echo 🔎 Branche actuelle : %CURRENT_BRANCH%

echo.
if "%CURRENT_BRANCH%"=="master" (
    echo 🔀 Renommage de master → main...
    git branch -M main
)

echo.
echo 🔗 Vérification du remote origin...
git remote get-url origin >nul 2>&1
if %errorlevel% neq 0 (
    echo 🔗 Ajout du remote origin...
    git remote add origin %REPO_URL%
)

echo.
echo 🔄 Pull depuis GitHub pour éviter les conflits...
git pull origin %BRANCH% --allow-unrelated-histories

echo.
echo ➕ Ajout des fichiers modifiés...
git add .

echo.
REM === GENERATION MESSAGE DE COMMIT AVEC DATE ===
for /f "tokens=1-3 delims=/: " %%a in ("%date%") do (
    set dd=%%a
    set mm=%%b
    set yyyy=%%c
)
for /f "tokens=1-2 delims=: " %%a in ("%time%") do (
    set hh=%%a
    set min=%%b
)
set MESSAGE=Auto-update_%yyyy%-%mm%-%dd%_%hh%h%min%

echo 📝 Commit : %MESSAGE%
git commit -m "%MESSAGE%"

echo.
echo 🚀 Push vers GitHub...
git push -u origin %BRANCH%

echo.
echo =======================================================
echo      ✅ SYNC GITHUB TERMINÉ — PRO MODE ACTIVÉ
echo =======================================================
echo.
pause
