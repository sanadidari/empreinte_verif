# ============================================================
# SANAD IDARI – AUTO SYNC GITHUB PRO (Every 5 minutes)
# ============================================================

$ProjectPath = "C:\samir_flutter\empreinte_verif"
$RepoURL = "https://github.com/sanadidari/empreinte_verif.git"
$Branch = "main"

Set-Location $ProjectPath

# Configure Git
git config --global user.name "sanadidari"
git config --global user.email "schatwiti@gmail.com"

while ($true) {

    Write-Output "Checking project at $(Get-Date)"

    git add .

    $status = git status --porcelain

    if ($status) {

        $timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
        $message = "Auto-sync_$timestamp"

        Write-Output "Changes detected -> Commit and Push"

        git commit -m $message
        git pull origin $Branch --allow-unrelated-histories
        git push origin $Branch

        Write-Output "Push completed at $(Get-Date)"
    }
    else {
        Write-Output "No changes detected"
    }

    Start-Sleep -Seconds 300
}
