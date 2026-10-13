# Git Branch Merge Automation Script

$ErrorActionPreference = Stop

Write-Host Starting Git automation... -ForegroundColor Cyan

# 1. Switch to dev branch
git switch dev
if ($LASTEXITCODE -ne 0) { exit 1 }

# 2. Pull latest changes from dev
git pull origin dev
if ($LASTEXITCODE -ne 0) { exit 1 }

# 3. Switch to devops-testing branch
git switch main
if ($LASTEXITCODE -ne 0) { exit 1 }

# 4. Merge dev into devops-testing
git merge dev
if ($LASTEXITCODE -ne 0) {
    Write-Host Merge failed or conflicts need resolution. -ForegroundColor Red
    exit 1
}

# 5. Push devops-testing to origin
git push origin main
if ($LASTEXITCODE -ne 0) { exit 1 }

Write-Host Git automation completed successfully! -ForegroundColor Green