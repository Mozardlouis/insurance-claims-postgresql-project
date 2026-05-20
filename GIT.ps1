Write-Host "Git status..."
git status

Write-Host "Adding files..."
git add .

$Message = Read-Host "Enter commit message"

Write-Host "Creating commit..."
git commit -m "$Message"

Write-Host "Pushing to GitHub..."
git push

Write-Host "Done."