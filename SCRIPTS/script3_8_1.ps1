
Import-Csv .\groups.csv | ForEach-Object { `
    New-LocalGroup -Name $_.nombre_grupos | Out-Null
    Write-Host "Se ha creado el grupo" $_.nombre_grupos
}

Import-Csv .\ejer3_8_1.csv | ForEach-Object { `
    $pass = Read-Host -Prompt 'Indica la contraseña para '$_.name 
                      -AsSecureString
    $desc = Read-Host -Prompt "Indica la descripción para "$_.name
    New-LocalUser `
        -Name $_.nombre `
        -FullName $_.nombreCompleto `
        -Description $desc `
        -Password $pass `

    Add-LocalGroupMember -Group $_.nombre_grupos -Member $_.nombre | Out-Null
}