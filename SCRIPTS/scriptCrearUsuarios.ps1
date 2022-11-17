# Creación de usuarios...
Write-Host "Creando usuarios..."
$count = 0
Import-Csv .\SCRIPTS\users.csv | ForEach-Object {
    Write-Host "Creadno el usuario "$_.nombre
    $pass = ConvertTo-SecureString -AsPlainText $_.pass -Force
    New-LocalUser -Name $_.nombre -Password $pass
    $count = $count + 1
}
Write-Host "Se han creado "$count" usuarios"