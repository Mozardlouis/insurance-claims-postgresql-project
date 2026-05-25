git remote add origin https://github.com/Mozardlouis/insurance-claims-postgresql-project.git
git branch -M main
git push -u origin main

Write-Host "Git status..."
git status

Write-Host "Adding files..."
git add .

$Message = Read-Host "Première version"

Write-Host "Creating commit..."
git commit -m "$Message"

Write-Host "Pushing to GitHub..."
git push

Write-Host "Done."


Write-Host "deuxième version"
git status
git add .
git commit -m "Enlever le mot de passe de la vue du public"
git push