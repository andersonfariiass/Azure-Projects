# Script Power Shell para criação de redes virtuais na cloud Azure
# Autor: Danilo Bastos
# Versão: 0.1
# Solictando ao operador o nome da subnet que será criada na VNet
$SubNetName = Read-Host "Informe o nome desejado para a subnet "

# Solicitando o bloco de ip's para a subnet que será criada
$PrefixDataNet = Read-Host "Informe o prefixo de rede que deseja atribuir a subnet (Ex.: 10.0.0.0/16)"

# Variável de criação da subnet com as informações fornecidas pelo operador
    $CreateSubNet1 = New-AzVirtualNetworkSubnetConfig -Name $SubNetName -AddressPrefix $PrefixDataNet

# Solicitando ao operador o nome da VNet que será criada
    $VNetName = Read-Host "Informe o nome que deseja atribuir a VNet"

# Atribuição ao Resource Group, listando ou criando um novo Rersource Group
        Write-Host "Você necessita atribuir a sua VNet a um resor"