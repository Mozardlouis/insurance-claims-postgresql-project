# PostgreSQL project execution script

$PsqlPath = "C:\Program Files\PostgreSQL\18\bin\psql.exe"
$DatabaseName = "insurance"
$UserName = "postgres"
$env:PGPASSWORD = Get-Content ".\.pg_password.txt" -Raw


Write-Host "Step 1 - Creating database..."
& $PsqlPath -U $UserName -f "sql/01_create_schema.sql"

Write-Host "Step 2 - Creating tables..."
& $PsqlPath -U $UserName -d $DatabaseName -f "sql/02_create_tables.sql"

Write-Host "Step 3 - Inserting sample data..."
& $PsqlPath -U $UserName -d $DatabaseName -f "sql/03_insert_reference_data.sql"

Write-Host "Step 4 - Creating views..."
& $PsqlPath -U $UserName -d $DatabaseName -f "sql/04_create_views.sql"

Write-Host "Step 5 - Creating procedures and functions..."
& $PsqlPath -U $UserName -d $DatabaseName -f "sql/06_procedures_functions.sql"

Write-Host "Step 6 - Creating indexes and performance scripts..."
& $PsqlPath -U $UserName -d $DatabaseName -f "sql/05_role_security.sql"

Write-Host "Step 7 - Creating roles and permissions..."
& $PsqlPath -U $UserName -d $DatabaseName -f "sql/07_users_and_access.sql"

Write-Host "Step 8 - Running test queries..."
& $PsqlPath -U $UserName -d $DatabaseName -f "sql/08_data_ingestion.sql"
Remove-Item $Env:PGPASSWORD

Write-Host "Project execution completed."