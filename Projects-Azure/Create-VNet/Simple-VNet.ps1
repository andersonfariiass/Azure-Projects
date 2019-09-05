# Script para criação de uma VNet Simples
# Definição de variável para criação de subnet
$CreateSubNet1 = New-AzVirtualNetworkSubnetConfig -Name "VNetSub02-1" -AddressPrefix "10.0.0.0/25"

    # Comando para criação da VNet desejada
    New-AzVirtualNetwork -Name "VNet-Test-Cli" -ResourceGroupName `
     "Test-Cloud02" -Location "brazilsouth" -AddressPrefix "10.0.0.0/24" -Subnet $CreateSubNet1 #Subnet definida

     #END