# Leemos el archivo de empleados.csv
Import-Csv empleados.csv | ForEach-Object { `
    # Guardamos en variables cada campo
    $nombre = $_.nombre
    $apellido1 = $_.apellido1
    $apellido2 = $_.apellido2
    $passSecure = $_.pass
    # Hasheamos la contraseña
    $pass = ConvertTo-SecureString -AsPlainText $passSecure -Force
}

# Ruta en la máquina física
$root = D:\ISO\practicas\Proyecto_Primera_Evaluacion

# Creación de disco duro
New-VHD `
    -NewVHDPath $root\VMs\W10VM_Plantilla.vhdx 
    -Path $root\VMs
    -NewVHDSizeBytes 20GB

# Creación de máquinas virtuales
New-VM `
    -Name W10VM_Plantilla.vhdx
    -MemoryStartupBytes 4GB
    -BootDevice VHD
    -VHDPath .\HDs\
    -Path .\VMs\
    -Generation 2
    -Switch ExternalSwitch